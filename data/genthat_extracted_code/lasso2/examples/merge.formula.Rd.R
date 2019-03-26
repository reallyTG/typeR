library(lasso2)


### Name: merge.formula
### Title: Merge Formula With Right Hand Side of Second Formula
### Aliases: merge.formula
### Keywords: utilities

### ** Examples

merge(y ~ x1, ~ x2) ## ->  y ~ x1 + x2

f2 <- merge(y ~ x1*x2, z ~ (x2+x4)^3)
f. <- merge(y ~ x1*x2,   ~ (x2+x4)^3) # no LHS for 2nd term
f2
stopifnot(f2 == f.)



