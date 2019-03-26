library(did)


### Name: expf
### Title: expf
### Aliases: expf

### ** Examples

data(mpdta)
dta <- subset(mpdta, year==2007)
X <- model.matrix(~lpop, data=dta)
X <- expf(X, X[1,])




