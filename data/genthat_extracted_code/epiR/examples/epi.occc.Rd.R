library(epiR)


### Name: epi.occc
### Title: Overall concordance correlation coefficient (OCCC)
### Aliases: epi.occc print.epi.occc summary.epi.occc
### Keywords: htest

### ** Examples

## Generate some artificial ratings data:
set.seed(1234)
p <- runif(10, 0, 1)
x <- replicate(n = 5, expr = rbinom(10, 4, p) + 1)

rval <- epi.occc(dat = x, pairs = TRUE)
print(rval); summary(rval)




