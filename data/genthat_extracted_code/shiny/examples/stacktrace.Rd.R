library(shiny)


### Name: stacktrace
### Title: Stack trace manipulation functions
### Aliases: stacktrace captureStackTraces withLogErrors printError
###   printStackTrace extractStackTrace formatStackTrace
###   conditionStackTrace conditionStackTrace<- ..stacktraceon..
###   ..stacktraceoff..
### Keywords: internal

### ** Examples

# Keeps tryCatch and withVisible related calls off the
# pretty-printed stack trace

visibleFunction1 <- function() {
  stop("Kaboom!")
}

visibleFunction2 <- function() {
  visibleFunction1()
}

hiddenFunction <- function(expr) {
  expr
}

# An example without ..stacktraceon/off.. manipulation.
# The outer "try" is just to prevent example() from stopping.
try({
  # The withLogErrors call ensures that stack traces are captured
  # and that errors that bubble up are logged using warning().
  withLogErrors({
    # tryCatch and withVisible are just here to add some noise to
    # the stack trace.
    tryCatch(
      withVisible({
        hiddenFunction(visibleFunction2())
      })
    )
  })
})

# Now the same example, but with ..stacktraceon/off.. to hide some
# of the less-interesting bits (tryCatch and withVisible).
..stacktraceoff..({
  try({
    withLogErrors({
      tryCatch(
        withVisible(
          hiddenFunction(
            ..stacktraceon..(visibleFunction2())
          )
        )
      )
    })
  })
})





