library(gestalt)


### Name: fn
### Title: Function Declarations with Quasiquotation
### Aliases: fn fn_

### ** Examples

fn(x ~ x + 1)
fn(x, y ~ x + y)
fn(x, y = 2 ~ x + y)
fn(x, y = 1, ... ~ log(x + y, ...))

# to specify '...' in the middle, write '... = '
fn(x, ... = , y ~ log(x + y, ...))

# use one-sided formula for constant functions or commands
fn(~ NA)
fn(~ message("!"))

# unquoting is supported (using `!!` from rlang)
zero <- 0
fn(x = !!zero ~ x > !!zero)

# formals and function bodies can also be spliced in
f <- function(x, y) x + y
g <- function(y, x, ...) x - y
frankenstein <- fn(!!!formals(f), ~ !!body(g))
stopifnot(identical(frankenstein, function(x, y) x - y))
## No test: 
# mixing unquoting and literal unquoting is possible
library(dplyr)

summariser <- quote(mean)

my_summarise <- fn(df, ... ~ {
  group_by <- quos(...)
  df %>%
    group_by(QUQS(group_by)) %>%
    summarise(a = `!!`(summariser)(a))
})
my_summarise
## End(No test)

# Use fn_() with fn() as a concise way to force ("pin down") bindings
# For example, the 'x' is immutable in the function produced by call_upon():
call_upon <- fn_(x ~ fn(f ~ f(!!x)))
sapply(list(sin, cos), call_upon(0))  # [1] 0 1

# Return-value checking, as a functional transformation
enforce <- fn_(condition ~
  fn(x ~ {
    stopifnot(!!substitute(condition))
    x
  })
)
no_nan <- enforce(!is.nan(x))
## No test: 
log_strict <- fn(x ~ no_nan(log(x)))
log_strict(2)   # [1] 0.6931472
log_strict(-1)  # Error: !is.nan(x) is not TRUE
## End(No test)




