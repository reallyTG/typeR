library(rrcov)


### Name: plot-methods
### Title: Methods for Function 'plot' in Package 'rrcov'
### Aliases: plot-methods plot,CovClassic-method
###   plot,CovClassic,missing-method plot,CovRobust-method
###   plot,CovRobust,missing-method
### Keywords: methods

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
cv <- CovClassic(hbk.x)
plot(cv)
rcv <- CovMest(hbk.x)
plot(rcv)



