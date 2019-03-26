library(gnm)


### Name: MultHomog
### Title: Specify a Multiplicative Interaction with Homogeneous Effects in
###   a gnm Model Formula
### Aliases: MultHomog
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)

###  Fit an association model with homogeneous row-column effects
rc1 <- gnm(Freq ~ r + c + Diag(r,c) + MultHomog(r, c),
           family = poisson, data = friend)
rc1

## Not run: 
##D ###  Extend to two-component interaction
##D rc2 <- update(rc1, . ~ . + MultHomog(r, c, inst = 2),
##D               etastart = rc1$predictors)
##D rc2
## End(Not run)

### For factors with a large number of levels, save time by
### setting diagonal elements to NA rather than fitting exactly;
### skipping start-up iterations may also save time
dat <- as.data.frame(friend)
id <- with(dat, r == c)
dat[id,] <- NA
rc2 <- gnm(Freq ~ r + c + instances(MultHomog(r, c), 2),
           family = poisson, data = dat, iterStart = 0)





