library(metafor)


### Name: plot.infl.rma.uni
### Title: Plot Method for 'infl.rma.uni' Objects
### Aliases: plot.infl.rma.uni
### Keywords: hplot

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year, data=dat.bcg)
plot(influence(res))
plot(influence(res), plotinf=1:4)
plot(influence(res), plotinf=1:4, layout=c(4,1))
plot(influence(res), plotdfbs=TRUE)



