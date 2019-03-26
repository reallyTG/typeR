library(did)


### Name: onefun
### Title: onefun
### Aliases: onefun

### ** Examples

data(mpdta)
dta <- subset(mpdta, year==2007)
X <- model.matrix(~lpop, data=dta)
X <- onefun(X, X[1,])




