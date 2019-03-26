library(nofrills)


### Name: as_fn
### Title: Abbreviated functional arguments
### Aliases: as_fn

### ** Examples

call_fn <- function(.f, x) {
  f <- as_fn(.f)
  f(x)
}
call_fn(log, 1)
call_fn(.(. ~ sin(.) ^ 2), 1)
# simplified function expressions support quasiquotation
f <- sin
call_fn(.(. ~ (!!f)(.) ^ 2), 1)

## wrap Map() to accept abbreviated anonymous function expressions
Map_ <- function (f, ...) {
  f <- as_fn(f)
  mapply(FUN = f, ..., SIMPLIFY = FALSE)
}
# you can call Map_() just like Map()
Map_(function(x, y, z) paste(x, y, paste("and", z), sep = ", "), 1:3, 4:6, 7:9)
# or use a simplified function expression
Map_(.(x, y, z ~ paste(x, y, paste("and", z), sep = ", ")), 1:3, 4:6, 7:9)

## abbreviated anonymous functions are interpreted in the calling environment
# so this works, as expected
foo <- function(a) as_fn(a)
foo(.(x ~ x + 1))
# but as_fn() can't interpret abbreviated anonymous functions across calls
foo <- function(a) bar(a)
bar <- function(b) as_fn(b)
## Not run: 
##D foo(.(x ~ x + 1))
## End(Not run)




