library(nofrills)


### Name: fn
### Title: Low-cost anonymous functions
### Aliases: fn

### ** Examples

fn(x ~ x + 1)
fn(x, y ~ x + y)
fn(x, y = 2 ~ x + y)
fn(x, y = 1, ... ~ log(x + y, ...))

## to specify '...' in the middle, write '... = '
fn(x, ... = , y ~ log(x + y, ...))

## use one-sided formula for constant functions or commands
fn(~ NA)
fn(~ message("!"))

## unquoting is supported (using `!!` from rlang)
zero <- 0
fn(x = !!zero ~ x > !!zero)

## formals and function bodies can also be spliced in
f <- function(x, y) x + y
g <- function(y, x, ...) x - y
frankenstein <- fn(!!!formals(f), ~ !!body(g))
stopifnot(identical(frankenstein, function(x, y) x - y))

## mixing unquoting and literal unquoting is possible
if (suppressWarnings(require(dplyr))) {
  summariser <- quote(mean)

  my_summarise <- fn(df, ... ~ {
    group_by <- quos(...)
    df %>%
      group_by(QUQS(group_by)) %>%
      summarise(a = `!!`(summariser)(a))
  })

  my_summarise
}




