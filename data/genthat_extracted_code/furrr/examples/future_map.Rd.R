library(furrr)


### Name: future_map
### Title: Apply a function to each element of a vector via futures
### Aliases: future_map future_map_chr future_map_dbl future_map_int
###   future_map_lgl future_map_dfr future_map_dfc future_map_if
###   future_map_at

### ** Examples


library(furrr)
library(dplyr) # for the pipe

## No test: 
plan(multiprocess)
## End(No test)

1:10 %>%
  future_map(rnorm, n = 10) %>%
  future_map_dbl(mean)

# If each element of the output is a data frame, use
# future_map_dfr to row-bind them together:
mtcars %>%
  split(.$cyl) %>%
  future_map(~ lm(mpg ~ wt, data = .x)) %>%
  future_map_dfr(~ as.data.frame(t(as.matrix(coef(.)))))

# You can be explicit about what gets exported to the workers

# To see this, use multisession (NOT multicore if on a Mac as the forked workers
# still have access to this environment)
## No test: 
plan(multisession)
## End(No test)
x <- 1
y <- 2

# This will fail, y is not exported (no black magic occurs)
# future_map(1, ~y, .options = future_options(globals = "x"))

# y is exported
future_map(1, ~y, .options = future_options(globals = "y"))





