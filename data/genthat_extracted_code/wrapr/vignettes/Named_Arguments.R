## ------------------------------------------------------------------------
#' Increment x by inc.
#' 
#' @param x item to add to
#' @param ... not used for values, forces later arguments to bind by name
#' @param inc (optional) value to add
#' @return x+inc
#'
#' @examples
#'
#' f(7) # returns 8
#'
f <- function(x, ..., inc = 1) {
   wrapr::stop_if_dot_args(substitute(list(...)), "f")
   x + inc
}

f(7)

f(7, inc = 2)

tryCatch(
  f(7, q = mtcars),
  error = function(e) { print(e) })

tryCatch(
  f(7, 2),
  error = function(e) { print(e) })

