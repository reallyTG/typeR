library(purrr)


### Name: accumulate
### Title: Accumulate intermediate results of a vector reduction
### Aliases: accumulate accumulate2

### ** Examples

# With an associative operation, the final value is always the
# same, no matter the direction. You'll find it in the last element for a
# backward (left) accumulation, and in the first element for forward
# (right) one:
1:5 %>% accumulate(`+`)
1:5 %>% accumulate(`+`, .dir = "backward")

# The final value is always equal to the equivalent reduction:
1:5 %>% reduce(`+`)

# It is easier to understand the details of the reduction with
# `paste()`.
accumulate(letters[1:5], paste, sep = ".")

# Note how the intermediary reduced values are passed to the left
# with a left reduction, and to the right otherwise:
accumulate(letters[1:5], paste, sep = ".", .dir = "backward")

# `accumulate2()` is a version of `accumulate()` that works with
# 3-argument functions and one additional vector:
paste2 <- function(x, y, sep = ".") paste(x, y, sep = sep)
letters[1:4] %>% accumulate(paste2)
letters[1:4] %>% accumulate2(c("-", ".", "-"), paste2)


# You can shortcircuit an accumulation and terminate it early by
# returning a value wrapped in a done(). In the following example
# we return early if the result-so-far, which is passed on the LHS,
# meets a condition:
paste3 <- function(out, input, sep = ".") {
  if (nchar(out) > 4) {
    return(done(out))
  }
  paste(out, input, sep = sep)
}
letters %>% accumulate(paste3)

# Note how we get twice the same value in the accumulation. That's
# because we have returned it twice. To prevent this, return an empty
# done box to signal to accumulate() that it should terminate with the
# value of the last iteration:
paste3 <- function(out, input, sep = ".") {
  if (nchar(out) > 4) {
    return(done())
  }
  paste(out, input, sep = sep)
}
letters %>% accumulate(paste3)

# Here the early return branch checks the incoming inputs passed on
# the RHS:
paste4 <- function(out, input, sep = ".") {
  if (input == "f") {
    return(done())
  }
  paste(out, input, sep = sep)
}
letters %>% accumulate(paste4)


# Simulating stochastic processes with drift
## Not run: 
##D library(dplyr)
##D library(ggplot2)
##D 
##D rerun(5, rnorm(100)) %>%
##D   set_names(paste0("sim", 1:5)) %>%
##D   map(~ accumulate(., ~ .05 + .x + .y)) %>%
##D   map_dfr(~ tibble(value = .x, step = 1:100), .id = "simulation") %>%
##D   ggplot(aes(x = step, y = value)) +
##D     geom_line(aes(color = simulation)) +
##D     ggtitle("Simulations of a random walk with drift")
## End(Not run)



