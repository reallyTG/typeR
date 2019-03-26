context("config_file_location")

test_that("config_file_location returns a character", {
  loc <- config_file_location()
  expect_is(loc, "character")
})

test_that("should be able to set and get a default qsub config", {
  if (file.exists(config_file_location())) {
    prev <- get_default_qsub_config()
  } else {
    prev <- NULL
  }
  on.exit(set_default_qsub_config(prev))

  # test whether you can save a config
  config <- create_qsub_config(remote = "foo", local_tmp_path = "/help", remote_tmp_path = "/bar")
  set_default_qsub_config(config)
  expect_equal(get_default_qsub_config(), config)

  # test whether you can save a config non-permanently
  config2 <- create_qsub_config(remote = "foo2", local_tmp_path = "/help2", remote_tmp_path = "/bar2")
  set_default_qsub_config(config2, permanent = FALSE)
  expect_equal(get_default_qsub_config(), config2)

  # test whether you can revert afterwards
  set_default_qsub_config(NULL, permanent = FALSE)
  expect_equal(get_default_qsub_config(), config)
})
