library(nseval)


### Name: function_
### Title: Explicitly create closures.
### Aliases: function_ arglist

### ** Examples

f1 <- function(x, y = x) { x + y }
f2 <- function_(alist(x = , y = x),
                quote( { x + y } ),
                environment())
identical(f1, f2) # TRUE

# `fn` makes a compact way to write functions;
# `fn(x+y)` is equivalent to `function(x, y) x+y`
fn <- function(exp) {
  exp_ <- arg(exp)
  nn <- arglist(all.names(expr(exp_), functions=FALSE))
  function_(nn, expr(exp_), env(exp_))
}

fn(x^2)
fn(x+y)



