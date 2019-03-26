library(rlang)


### Name: abort
### Title: Signal an error, warning, or message
### Aliases: abort warn inform signal interrupt

### ** Examples

# These examples are guarded to avoid throwing errors
if (FALSE) {

# Signal an error with a message just like stop():
abort("Something bad happened")

# Give a class to the error:
abort("Something bad happened", "somepkg_bad_error")

# This will allow your users to handle the error selectively
tryCatch(
  somepkg_function(),
  somepkg_bad_error = function(err) {
    warn(err$message) # Demote the error to a warning
    NA                # Return an alternative value
  }
)

# You can also specify metadata that will be stored in the condition:
abort("Something bad happened", "somepkg_bad_error", data = 1:10)

# This data can then be consulted by user handlers:
tryCatch(
  somepkg_function(),
  somepkg_bad_error = function(err) {
    # Compute an alternative return value with the data:
    recover_error(err$data)
  }
)

# If you call low-level APIs it is good practice to catch technical
# errors and rethrow them with a more meaningful message. Pass on
# the caught error as `parent` to get a nice decomposition of
# errors and backtraces:
file <- "http://foo.bar/baz"
tryCatch(
  download(file),
  error = function(err) {
    msg <- sprintf("Can't download `%s`", file)
    abort(msg, parent = err)
})

# Unhandled errors are saved automatically by `abort()` and can be
# retrieved with `last_error()`. The error prints with a simplified
# backtrace:
abort("Saved error?")
last_error()

# Use `summary()` to print the full backtrace and the condition fields:
summary(last_error())

}



