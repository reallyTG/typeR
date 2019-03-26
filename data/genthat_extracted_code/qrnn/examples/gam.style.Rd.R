library(qrnn)


### Name: gam.style
### Title: Modified generalized additive model plots for interpreting QRNN
###   models
### Aliases: gam.style

### ** Examples

## YVR precipitation data with seasonal cycle and NCEP/NCAR Reanalysis
## covariates
data(YVRprecip)

y <- YVRprecip$precip
x <- cbind(sin(2*pi*seq_along(y)/365.25),
           cos(2*pi*seq_along(y)/365.25),
           YVRprecip$ncep)

## Fit QRNN, additive QRNN (QADD), and quantile regression (QREG)
## models for the conditional 75th percentile
set.seed(1)
train <- c(TRUE, rep(FALSE, 49))
w.qrnn <- qrnn.fit(x=x[train,], y=y[train,,drop=FALSE],
                   n.hidden=2, tau=0.75, iter.max=500,
                   n.trials=1, lower=0, penalty=0.01)
w.qadd <- qrnn.fit(x=x[train,], y=y[train,,drop=FALSE],
                   n.hidden=ncol(x), tau=0.75, iter.max=250,
                   n.trials=1, lower=0, additive=TRUE)
w.qreg <- qrnn.fit(x=x[train,], y=y[train,,drop=FALSE],
                   tau=0.75, iter.max=100, n.trials=1,
                   lower=0, Th=linear, Th.prime=linear.prime)

## GAM-style plots for slp, sh700, and z500
for (column in 3:5) {
    gam.style(x[train,], parms=w.qrnn, column=column,
              main="QRNN")
    gam.style(x[train,], parms=w.qadd, column=column,
              main="QADD")
    gam.style(x[train,], parms=w.qreg, column=column,
              main="QREG")
}



