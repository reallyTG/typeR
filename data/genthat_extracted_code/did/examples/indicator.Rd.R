library(did)


### Name: indicator
### Title: indicator
### Aliases: indicator

### ** Examples

data(mpdta)
dta <- subset(mpdta, year==2007)
X <- model.matrix(~lpop, data=dta)
X <- indicator(X, X[1,])




