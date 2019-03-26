library(vetr)


### Name: vet
### Title: Verify Objects Meet Structural Requirements
### Aliases: vet tev tev

### ** Examples

## template vetting
vet(numeric(2L), runif(2))
vet(numeric(2L), runif(3))
vet(numeric(2L), letters)
try(vet(numeric(2L), letters, stop=TRUE))

## `tev` just reverses target and current for use with maggrittr
## Not run: 
##D if(require(magrittr)) {
##D   runif(2) %>% tev(numeric(2L))
##D   runif(3) %>% tev(numeric(2L))
##D }
## End(Not run)
## Zero length templates are wild cards
vet(numeric(), runif(2))
vet(numeric(), runif(100))
vet(numeric(), letters)

## This extends to data.frames
iris.tpl <- iris[0,]   # zero row matches any # of rows
iris.1 <- iris[1:10,]
iris.2 <- iris[1:10, c(1,2,3,5,4)]  # change col order
vet(iris.tpl, iris.1)
vet(iris.tpl, iris.2)

## Short (<100 length) integer-like numerics will
## pass for integer
vet(integer(), c(1, 2, 3))
vet(integer(), c(1, 2, 3) + 0.1)

## Nested templates; note, in packages you should consider
## defining templates outside of `vet` or `vetr` so that
## they are computed on load rather that at runtime
tpl <- list(numeric(1L), matrix(integer(), 3))
val.1 <- list(runif(1), rbind(1:10, 1:10, 1:10))
val.2 <- list(runif(1), cbind(1:10, 1:10, 1:10))
vet(tpl, val.1)
vet(tpl, val.2)

## See `example(alike)` for more template examples

## Standard tokens allow you to check values
vet(. > 0, runif(10))
vet(. > 0, -runif(10))

## Zero length token results are considered TRUE,
## as is the case with `all(logical(0))`
vet(. > 0, numeric())

## `all_bw` is like `isTRUE(all(. >= x & . <= y))`, but
## ~10x faster for long vectors:
vet(all_bw(., 0, 1), runif(1e6) + .1)

## You can combine templates and standard tokens with
## `&&` and/or `||`
vet(numeric(2L) && . > 0, runif(2))
vet(numeric(2L) && . > 0, runif(10))
vet(numeric(2L) && . > 0, -runif(2))

## Using pre-defined tokens (see `?vet_token`)
vet(INT.1, 1)
vet(INT.1, 1:2)
vet(INT.1 && . %in% 0:1 || LGL.1, TRUE)
vet(INT.1 && . %in% 0:1 || LGL.1, 1)
vet(INT.1 && . %in% 0:1 || LGL.1, NA)

## Vetting expressions can be assembled from previously
## defined tokens
scalar.num.pos <- quote(numeric(1L) && . > 0)
foo.or.bar <- quote(character(1L) && . %in% c('foo', 'bar'))
vet.exp <- quote(scalar.num.pos || foo.or.bar)

vet(vet.exp, 42)
vet(scalar.num.pos || foo.or.bar, 42)  # equivalently
vet(vet.exp, "foo")
vet(vet.exp, "baz")



