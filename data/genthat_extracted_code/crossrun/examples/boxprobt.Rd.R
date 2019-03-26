library(crossrun)


### Name: boxprobt
### Title: Box Cumulative Sums
### Aliases: boxprobt

### ** Examples

nill <- Rmpfr::mpfr(0, 120)
one <- Rmpfr::mpfr(1, 120)
two <- Rmpfr::mpfr(2, 120)
contents <- c(one,nill,nill, one,one,one, two,two,two)
mtrx3 <- Rmpfr::mpfr2array(contents, dim = c(3, 3))
print(mtrx3)
print(boxprobt(mtrx3))



