library(MBESS)


### Name: conf.limits.nc.chisq
### Title: Confidence limits for noncentral chi square parameters
### Aliases: conf.limits.nc.chisq
### Keywords: design multivariate regression

### ** Examples

# A typical call to the function.
conf.limits.nc.chisq(Chi.Square=30, conf.level=.95, df=15)

# A one sided (upper) confidence interval.
 conf.limits.nc.chisq(Chi.Square=30, alpha.lower=0, alpha.upper=.05, 
 conf.level=NULL, df=15)



