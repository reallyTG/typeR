library(bit64)


### Name: unipos
### Title: Extract Positions of Unique Elements
### Aliases: unipos unipos.integer64
### Keywords: manip logic

### ** Examples

x <- as.integer64(sample(c(rep(NA, 9), 1:9), 32, TRUE))
unipos(x)
unipos(x, order="values")

stopifnot(identical(unipos(x),  (1:length(x))[!duplicated(x)]))
stopifnot(identical(unipos(x),  match.integer64(unique(x), x)))
stopifnot(identical(unipos(x, order="values"),  match.integer64(unique(x, order="values"), x)))
stopifnot(identical(unique(x),  x[unipos(x)]))
stopifnot(identical(unique(x, order="values"),  x[unipos(x, order="values")]))



