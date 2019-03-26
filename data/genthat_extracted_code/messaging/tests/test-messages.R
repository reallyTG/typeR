context("Create a formatted message")

test_that("Emitting a properly-formatted message from a function is possible", {

  library(messaging)

  # Create a `yield_message()` function
  yield_message <- function() {

    # Create some strings can serve as additional
    # info for the message
    message_pts <-
      c("* info part 1",
        "* info part 2",
        "* info part 3")

    # Get a numeric value to use in the message
    n_message_pts <- length(message_pts)

    # Generate and emit a formatted message
    emit_message(
      "information to note",
      message_pts,
      number = n_message_pts)
  }

  # Expect that a message is emitted
  expect_message(yield_message())

  # Capture the emitted messages
  captured_messages <-
    capture_messages(yield_message()) %>%
    stringr::str_split("\n") %>%
    unlist()

  # Expect certain statements to appear in the message
  expect_equal(
    captured_messages[1],
    "`yield_message()`: information to note")

  expect_equal(
    captured_messages[2],
    "* info part 1")

  expect_equal(
    captured_messages[3],
    "* info part 2")

  expect_equal(
    captured_messages[4],
    "* info part 3")
})
