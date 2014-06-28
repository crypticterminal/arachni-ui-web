# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140628211607) do

  create_table "comments", force: true do |t|
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispatchers", force: true do |t|
    t.integer  "owner_id"
    t.boolean  "global"
    t.boolean  "default"
    t.string   "address"
    t.integer  "port"
    t.float    "score"
    t.text     "description"
    t.text     "statistics"
    t.boolean  "alive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dispatchers_users", id: false, force: true do |t|
    t.integer "dispatcher_id", null: false
    t.integer "user_id",       null: false
  end

  create_table "issues", force: true do |t|
    t.string   "name"
    t.text     "url"
    t.text     "vector_name"
    t.float    "cvssv2"
    t.integer  "cwe"
    t.text     "description"
    t.string   "vector_type"
    t.string   "http_method"
    t.text     "tags"
    t.text     "headers"
    t.text     "signature"
    t.text     "seed"
    t.text     "proof"
    t.text     "response_body"
    t.boolean  "requires_verification"
    t.text     "audit_options"
    t.text     "references"
    t.text     "remedy_code"
    t.text     "remedy_guidance"
    t.text     "remarks"
    t.string   "severity"
    t.string   "digest"
    t.boolean  "false_positive",        default: false
    t.boolean  "verified",              default: false
    t.text     "verification_steps"
    t.text     "remediation_steps"
    t.boolean  "fixed",                 default: false
    t.integer  "scan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.string   "model_type"
    t.integer  "model_id"
    t.string   "action"
    t.integer  "actor_id"
    t.text     "text"
    t.boolean  "read",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier"
  end

  create_table "profiles", force: true do |t|
    t.integer  "owner_id"
    t.boolean  "global"
    t.boolean  "default"
    t.string   "name"
    t.text     "description"
    t.text     "scope_redundant_path_patterns"
    t.integer  "scope_directory_depth_limit"
    t.integer  "scope_page_limit"
    t.integer  "http_request_redirect_limit"
    t.integer  "http_request_concurrency"
    t.boolean  "audit_links"
    t.boolean  "audit_forms"
    t.boolean  "audit_cookies"
    t.boolean  "audit_headers"
    t.text     "checks"
    t.text     "authorized_by"
    t.string   "http_proxy_host"
    t.integer  "http_proxy_port"
    t.string   "http_proxy_username"
    t.text     "http_proxy_password"
    t.string   "http_proxy_type"
    t.text     "http_cookie_string"
    t.text     "http_user_agent"
    t.text     "scope_exclude_path_patterns"
    t.text     "scope_exclude_content_patterns"
    t.text     "exclude_cookies"
    t.text     "audit_exclude_vectors"
    t.text     "scope_include_path_patterns"
    t.boolean  "scope_include_subdomains"
    t.text     "plugins"
    t.text     "http_request_headers"
    t.text     "scope_restrict_paths"
    t.text     "scope_extend_paths"
    t.integer  "spawns"
    t.boolean  "audit_with_both_http_methods"
    t.boolean  "audit_cookies_extensively"
    t.boolean  "scope_exclude_binaries"
    t.integer  "scope_auto_redundant_path_patterns"
    t.boolean  "scope_https_only"
    t.text     "login_check_url"
    t.text     "login_check_pattern"
    t.integer  "http_request_timeout"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "no_fingerprinting"
    t.text     "platforms"
    t.string   "http_authentication_username"
    t.string   "http_authentication_password"
    t.integer  "http_request_queue_size",            default: 500
  end

  create_table "profiles_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "profile_id"
  end

  create_table "reports", force: true do |t|
    t.text     "object"
    t.text     "sitemap"
    t.integer  "scan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "scan_groups", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scan_groups_scans", id: false, force: true do |t|
    t.integer "scan_group_id", null: false
    t.integer "scan_id",       null: false
  end

  create_table "scan_groups_users", id: false, force: true do |t|
    t.integer "user_id",       null: false
    t.integer "scan_group_id", null: false
  end

  create_table "scans", force: true do |t|
    t.string   "type"
    t.boolean  "active",                        default: false
    t.boolean  "extend_from_revision_sitemaps"
    t.boolean  "restrict_to_revision_sitemaps"
    t.integer  "instance_count",                default: 1
    t.integer  "dispatcher_id"
    t.string   "instance_url"
    t.string   "instance_token"
    t.integer  "profile_id"
    t.text     "url"
    t.text     "description"
    t.text     "report"
    t.string   "status"
    t.text     "statistics"
    t.text     "issue_digests"
    t.text     "error_messages"
    t.integer  "owner_id"
    t.datetime "finished_at"
    t.integer  "root_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "started_at"
    t.integer  "schedule_id"
    t.boolean  "load_balance"
  end

  create_table "scans_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "scan_id"
  end

  create_table "schedules", force: true do |t|
    t.datetime "start_at"
    t.integer  "every_minute"
    t.integer  "every_hour"
    t.integer  "every_day"
    t.integer  "every_month"
    t.string   "basetime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.string   "name"
    t.integer  "scan_global_limit"
    t.integer  "scan_per_user_limit"
    t.text     "scan_target_whitelist_patterns"
    t.text     "scan_target_blacklist_patterns"
    t.text     "scan_allowed_types"
    t.text     "profile_allowed_checks"
    t.text     "profile_allowed_plugins"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "welcomed"
    t.string   "timezone",                       default: "Etc/UTC"
    t.boolean  "scan_auto_refresh",              default: true
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
