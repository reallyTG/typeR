context("auth")

# kntn_check_envvars_defined ----------------------------------------------------

test_that("kntn_check_envvars_defined returns TRUE when all envvars are defined", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "test")
  Sys.setenv("KNTN_AUTH_TYPE" = "test")

  expect_true(kntn_check_envvars_defined())
  expect_true(kntn_check_envvars_defined(assume_all = FALSE))
})

test_that("kntn_check_envvars_defined returns FALSE when no envvars are defined", {
  Sys.unsetenv("KNTN_URL")
  Sys.unsetenv("KNTN_AUTH")
  Sys.unsetenv("KNTN_AUTH_TYPE")

  expect_false(kntn_check_envvars_defined())
  expect_false(kntn_check_envvars_defined(assume_all = FALSE))
})

test_that("kntn_check_envvars_defined returns TRUE and FALSE when only one of the envvars is defined", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.unsetenv("KNTN_AUTH")
  Sys.unsetenv("KNTN_AUTH_TYPE")

  expect_false(kntn_check_envvars_defined())
  expect_true(kntn_check_envvars_defined(assume_all = FALSE))
})


# kntn_set_auth -------------------------------------------

test_that("kntn_set_auth raises error in noninteractive environment", {
  expect_error(kntn_set_auth(), regexp = "If you want to run kntnr in noninteractive environment")
})

# kntn_unset_auth ------------------------------------------

test_that("kntn_unset_auth clears envvars", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "test")
  Sys.setenv("KNTN_AUTH_TYPE" = "test")
  kntn_unset_auth()

  expect_false(kntn_check_envvars_defined(assume_all = FALSE))
})


# kntn_get_authorization_header ----------------------------

test_that("kntn_get_authorization_header with token", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "1234567890")
  Sys.setenv("KNTN_AUTH_TYPE" = "token")

  expect_equal(kntn_get_authorization_header(), httr::add_headers(`X-Cybozu-API-Token` = "1234567890"))
})

test_that("kntn_get_authorization_header with password", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "dXNlcm5hbWU6cGFzc3dvcmQ=")  # openssl::base64_encode(paste("username", "password", sep = ":"))
  Sys.setenv("KNTN_AUTH_TYPE" = "password")

  expect_equal(kntn_get_authorization_header(), httr::add_headers(`X-Cybozu-Authorization` = "dXNlcm5hbWU6cGFzc3dvcmQ="))
})


test_that("kntn_get_authorization_header raises error when KNTN_AUTH_TYPE is unknown", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "1234567890")
  Sys.setenv("KNTN_AUTH_TYPE" = "foooo")

  expect_error(kntn_get_authorization_header(), regexp = "Unknown KNTN_AUTH_TYPE")
})

test_that("kntn_get_authorization_header raises error when some envvar is missing", {
  Sys.setenv("KNTN_URL" = "test")
  Sys.setenv("KNTN_AUTH" = "1234567890")
  Sys.unsetenv("KNTN_AUTH_TYPE")

  expect_error(kntn_get_authorization_header(), regexp = "Please set necessary environmental variables")
})
