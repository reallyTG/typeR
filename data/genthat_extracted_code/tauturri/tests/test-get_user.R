context("test-get_user.R")

user_id <- 1352909

test_that("get_users works", {
  res <- get_users()
  expect_is(res, "tbl")
  expect_named(res, c(
    "username", "user_id", "is_allow_sync", "user_token", "is_admin",
    "is_restricted", "is_home_user", "email", "server_token"
  ))

  expect_error(get_users("", ""))
})

test_that("get_user_names works", {
  res <- get_user_names()
  expect_is(res, "tbl")
  expect_named(res, c("friendly_name", "user_id"))

  res <- get_user_names(add_pseudonym = TRUE)
  expect_is(res, "tbl")
  expect_named(res, c("friendly_name", "user_id", "pseudonym"))

  expect_error(get_user_names("", ""))
})

test_that("get_user_player_stats works", {
  res <- get_user_player_stats(user_id = user_id)
  expect_is(res, "tbl")
  expect_named(res, c(
    "user_id", "platform_name", "platform", "player_name", "total_plays",
    "result_id"
  ))

  expect_error(get_user_player_stats())
  expect_error(get_user_player_stats(url = "", apikey = "", user_id = user_id))
})

test_that("get_user_watch_time_stats works", {
  res <- get_user_watch_time_stats(user_id = user_id)
  expect_is(res, "tbl")
  expect_length(res, 4)
  expect_equal(nrow(res), 4)
  expect_named(res, c("user_id", "query_days", "total_time", "total_plays"))

  expect_error(get_user_watch_time_stats(url = "", apikey = "", user_id = user_id))
  expect_error(get_user_watch_time_stats())
})


test_that("get_users_table works", {
  res <- get_users_table(length = 10)
  expect_is(res, "tbl")
  expect_length(res, 22)
  expect_equal(nrow(res), 10)
  expect_named(res, c(
    "user_thumb", "parent_title", "player",
    "year", "duration", "rating_key", "user_id",
    "thumb", "id", "platform", "media_type",
    "do_notify", "allow_guest", "last_played",
    "transcode_decision", "plays", "ip_address",
    "media_index", "friendly_name", "keep_history",
    "parent_media_index", "last_seen"
  ))

  expect_error(get_users_table(url = "", apikey = ""))
})

test_that("get_user_ips works", {
  res <- get_user_ips(user_id = user_id, length = 10)
  expect_is(res, "tbl")
  expect_length(res, 17)
  expect_equal(nrow(res), 10)
  expect_named(res, c(
    "user_id", "last_played", "media_index", "player", "year", "friendly_name",
    "thumb", "rating_key", "play_count", "platform", "parent_title", "transcode_decision",
    "media_type", "parent_media_index", "ip_address", "id", "last_seen"
  ))

  expect_error(get_user_ips())
  expect_error(get_user_ips(url = "", apikey = "", user_id = user_id))
})


test_that("get_user_logins works", {
  res <- get_user_logins(user_id = 4936021, length = 1)
  expect_is(res, "tbl")
  expect_length(res, 10)
  expect_equal(nrow(res), 1)
  expect_named(res, c(
    "host", "os", "user_id", "user_agent", "success", "user_group", "friendly_name",
    "timestamp", "ip_address", "browser"
  ))

  expect_error(get_user_logins())
  expect_error(get_user_logins(url = "", apikey = "", user_id = 4936021))
})
