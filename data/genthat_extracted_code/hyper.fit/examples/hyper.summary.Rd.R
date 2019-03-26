library(hyper.fit)


### Name: hyper.summary
### Title: Summary function for hyper.fit object
### Aliases: hyper.summary summary.hyper.fit
### Keywords: fit summary

### ** Examples

#### Example using 6dFGS Fundamental Plane data ####

FP6dFGS=read.table(system.file('data/FP6dFGS.tab', package='hyper.fit'), header=TRUE)
fitFP6dFGSw=hyper.fit(FP6dFGS[,c('logIe_J', 'logsigma', 'logRe_J')],
vars=FP6dFGS[,c('logIe_J_err', 'logsigma_err', 'logRe_J_err')]^2, weights=FP6dFGS[,'weights'],
coord.type='alpha', scat.type='vert.axis')
summary(fitFP6dFGSw)




