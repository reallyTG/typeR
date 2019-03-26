## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

library(frite)
library(purrr)
library(tictoc)

## ----diagnostic----------------------------------------------------------
# Defining a new function
reduce_timed <- tictocify(reduce)

# Now to test it against the original reduce
reduce_timed(1:100000, sum, .init = 0) 

is.output.same(reduce_timed(1:100000, sum, .init = 0), reduce)

## ----modification--------------------------------------------------------
# Constructing a different version of reduce_timed
(reduce_timed1 <- line_insert(reduce, after_line = 1, quote(tic())))

(reduce_timed1 <- line_assign(reduce_timed1, line = 3, 'value'))

(reduce_timed1 <- line_insert(reduce_timed1, after_line = 3, quote(toc())))

(reduce_timed1 <- line_insert(reduce_timed1, after_line = 4,
                              quote(return(value))))

is.output.same(reduce_timed(1:100000, sum, .init = 0), reduce_timed1)

## ----helping, fig.width = 4, fig.height=3--------------------------------
plot_body(map)


map_hello <- map %>% 
  line_insert(after_line = 1, quote(print("Hello!")))

list_body(map_hello)

map_hello(list(1, 2, "b"), assertthat::is.number)

## ----recursion-----------------------------------------------------------
spammer <- function() {}

add_print <- function(.f, n) {
  
  .f <- line_insert(.f, 1, quote(print("a")))
  
  n <- n - 1
  
  if (n > 0) return(add_print(.f, n))
  if (n == 0) return(.f)
}

add_print(spammer, 5)

