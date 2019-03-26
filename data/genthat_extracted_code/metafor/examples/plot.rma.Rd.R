library(metafor)


### Name: plot.rma.uni
### Title: Plot Method for 'rma' Objects
### Aliases: plot.rma.uni plot.rma.mh plot.rma.peto plot.rma.glmm
### Keywords: hplot

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
plot(res, qqplot=TRUE)

### mixed-effects model with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
plot(res, qqplot=TRUE)



