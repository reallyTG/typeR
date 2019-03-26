context("Error")

test_that("Error works", {
  skip_on_cran()

  x <- Error$new()
  y <- Error$new(message_template = "{{status}} - foobar - {{reason}}")
  z <- Error$new(message_template_verbose = "{{status}} - {{message}}")

  expect_is(x, "Error")
  expect_is(y, "Error")
  expect_is(z, "Error")

  expect_is(x$behavior, "character")
  expect_is(y$behavior, "character")
  expect_is(z$behavior, "character")

  # the default
  ## simple message
  expect_is(x$message_template, "character")
  expect_match(x$message_template, "HTTP")
  expect_true(grepl("HTTP", x$message_template))
  expect_true(grepl("status", x$message_template))
  expect_true(grepl("reason", x$message_template))
  expect_false(grepl("message", x$message_template))
  ## verbose message
  expect_is(x$message_template_verbose, "character")
  expect_true(grepl("HTTP", x$message_template_verbose))
  expect_true(grepl("status", x$message_template_verbose))
  expect_true(grepl("reason", x$message_template_verbose))
  expect_true(grepl("message", x$message_template_verbose))

  # custom message_template
  expect_is(y$message_template, "character")
  expect_match(y$message_template, "status")
  expect_match(y$message_template, "reason")
  expect_match(y$message_template, "- foobar -")
  expect_false(grepl("HTTP", y$message_template))

  # custom message_template_verbose
  expect_is(z$message_template_verbose, "character")
  expect_match(z$message_template_verbose, "status")
  expect_match(z$message_template_verbose, "message")
  expect_false(grepl("HTTP", z$message_template_verbose))
  expect_false(grepl("reason", z$message_template_verbose))
})


test_that("Error - can set behavior", {
  skip_on_cran()

  x <- Error$new()
  expect_is(x, "Error")
  expect_equal(x$behavior, "stop")
  expect_equal(x$.__enclos_env__$private$behavior_type, "error")

  # reset behavior
  x$set_behavior("message")
  expect_is(x, "Error")
  expect_equal(x$behavior, "message")
  expect_equal(x$.__enclos_env__$private$behavior_type, "message")
})

