library(metafor)


### Name: influence.rma.uni
### Title: Outlier and Influential Case Diagnostics for 'rma.uni' Objects
### Aliases: influence.rma.uni print.infl.rma.uni cooks.distance.rma.uni
###   dfbetas.rma.uni hatvalues.rma.uni
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
influence(res)
plot(influence(res))

cooks.distance(res)
dfbetas(res)
hatvalues(res)



