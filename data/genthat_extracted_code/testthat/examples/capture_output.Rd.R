library(testthat)


### Name: capture_output
### Title: Capture output to console
### Aliases: capture_output capture_output_lines
### Keywords: internal

### ** Examples

capture_output({
  cat("Hi!\n")
  cat("Bye\n")
})

capture_output_lines({
  cat("Hi!\n")
  cat("Bye\n")
})

capture_output("Hi")
capture_output("Hi", print = TRUE)



