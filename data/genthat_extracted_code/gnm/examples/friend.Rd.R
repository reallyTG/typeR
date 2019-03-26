library(gnm)


### Name: friend
### Title: Occupation of Respondents and Their Closest Friend
### Aliases: friend
### Keywords: datasets

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




