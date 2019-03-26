library(purrr)


### Name: safely
### Title: Capture side effects.
### Aliases: safely quietly possibly auto_browse

### ** Examples

safe_log <- safely(log)
safe_log(10)
safe_log("a")

list("a", 10, 100) %>%
  map(safe_log) %>%
  transpose()

# This is a bit easier to work with if you supply a default value
# of the same type and use the simplify argument to transpose():
safe_log <- safely(log, otherwise = NA_real_)
list("a", 10, 100) %>%
  map(safe_log) %>%
  transpose() %>%
  simplify_all()

# To replace errors with a default value, use possibly().
list("a", 10, 100) %>%
  map_dbl(possibly(log, NA_real_))

# For interactive usage, auto_browse() is useful because it automatically
# starts a browser() in the right place.
f <- function(x) {
  y <- 20
  if (x > 5) {
    stop("!")
  } else {
    x
  }
}
if (interactive()) {
  map(1:6, auto_browse(f))
}

# It doesn't make sense to use auto_browse with primitive functions,
# because they are implemented in C so there's no useful environment
# for you to interact with.



