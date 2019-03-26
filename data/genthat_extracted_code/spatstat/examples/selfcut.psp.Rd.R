library(spatstat)


### Name: selfcut.psp
### Title: Cut Line Segments Where They Intersect
### Aliases: selfcut.psp
### Keywords: spatial manip

### ** Examples

  X <- psp(runif(10), runif(10), runif(10), runif(10), window=owin())
  Y <- selfcut.psp(X)
  n <- nsegments(Y)
  plot(Y %mark% factor(sample(seq_len(n), n, replace=TRUE)))



