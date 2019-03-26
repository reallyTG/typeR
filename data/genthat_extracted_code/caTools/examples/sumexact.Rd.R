library(caTools)


### Name: sumexact, cumsumexact
### Title: Basic Sum Operations without Round-off Errors
### Aliases: sumexact cumsumexact
### Keywords: ts smooth array utilities

### ** Examples

  x = c(1, 1e20, 1e40, -1e40, -1e20, -1)
  a = sum(x);         print(a)
  b = sumexact(x);    print(b)
  stopifnot(b==0)
  a = cumsum(x);      print(a)
  b = cumsumexact(x); print(b)
  stopifnot(b[6]==0)



