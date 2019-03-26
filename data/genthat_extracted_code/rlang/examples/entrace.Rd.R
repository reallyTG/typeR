library(rlang)


### Name: entrace
### Title: Add backtrace from error handler
### Aliases: entrace

### ** Examples

if (FALSE) {  # Not run

# Set the error handler in your RProfile like this:
if (requireNamespace("rlang", quietly = TRUE)) {
  options(error = rlang::entrace)
}

}



