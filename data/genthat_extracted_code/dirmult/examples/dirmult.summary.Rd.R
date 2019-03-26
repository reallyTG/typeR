library(dirmult)


### Name: dirmult.summary
### Title: Summary table of parameter estimates from dirmult
### Aliases: dirmult.summary

### ** Examples

data(us)
fit <- dirmult(us[[1]],epsilon=10^(-4),trace=FALSE)
dirmult.summary(us[[1]],fit)



