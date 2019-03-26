library(networkTomography)


### Name: tomogravity
### Title: Run tomogravity estimation on complete time series of aggregate
###   flows
### Aliases: tomogravity
### Keywords: models multivariate ts

### ** Examples

data(cmu)
estimate <- tomogravity(Y=cmu$Y.full[1, , drop=FALSE], A=cmu$A.full,
                        lambda=0.01, .progress='text')



