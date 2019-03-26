library(LARF)


### Name: npse
### Title: Nonparametric Power Series Estimation
### Aliases: npse

### ** Examples

data(c401k)
attach(c401k)

## Not run: 
##D # binary outcome
##D Z <- c401k$e401k
##D 
##D # covariates
##D X <- as.matrix(c401k[,c("inc", "male", "fsize"  )])
##D 
##D # get nonparametric power series estimation of the regression of Z on X
##D zp <- npse(Z~X, order = 5, m = 10, seed = 681)
##D 
##D # sum of residual squares of the cross-validations
##D zp$CV.Res
##D 
##D # the opitimal order of the power series
##D zp$Lambda
##D 
##D # summary of the predictions based on the optimal power series
##D summary(zp$fitted)
## End(Not run)



