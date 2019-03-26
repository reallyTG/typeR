library(testthat)


### Name: capture_condition
### Title: Capture conditions, including messeages, warnings, expectations,
###   and errors.
### Aliases: capture_condition capture_error capture_expectation
###   capture_message capture_warning capture_messages capture_warnings
### Keywords: internal

### ** Examples

f <- function() {
  message("First")
  warning("Second")
  message("Third")
}

capture_message(f())
capture_messages(f())

capture_warning(f())
capture_warnings(f())

# Condition will capture anything
capture_condition(f())



