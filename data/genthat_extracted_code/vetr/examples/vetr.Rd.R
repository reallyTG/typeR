library(vetr)


### Name: vetr
### Title: Verify Function Arguments Meet Structural Requirements
### Aliases: vetr

### ** Examples

fun1 <- function(x, y) {
  vetr(integer(), LGL.1)
  TRUE   # do some work
}
fun1(1:10, TRUE)
try(fun1(1:10, 1:10))

## only vet the second argument
fun2 <- function(x, y) {
  vetr(y=LGL.1)
  TRUE   # do some work
}
try(fun2(letters, 1:10))

## Nested templates; note, in packages you should consider
## defining templates outside of `vet` or `vetr` so that
## they are computed on load rather that at runtime
tpl <- list(numeric(1L), matrix(integer(), 3))
val.1 <- list(runif(1), rbind(1:10, 1:10, 1:10))
val.2 <- list(runif(1), cbind(1:10, 1:10, 1:10))
fun3 <- function(x, y) {
  vetr(x=tpl, y=tpl && ncol(.[[2]]) == ncol(x[[2]]))
  TRUE   # do some work
}
fun3(val.1, val.1)
try(fun3(val.1, val.2))
val.1.a <- val.1
val.1.a[[2]] <- val.1.a[[2]][, 1:8]
try(fun3(val.1, val.1.a))



