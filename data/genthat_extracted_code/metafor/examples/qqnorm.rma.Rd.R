library(metafor)


### Name: qqnorm.rma.uni
### Title: Normal QQ Plots for 'rma' Objects
### Aliases: qqnorm.rma.uni qqnorm.rma.mh qqnorm.rma.peto qqnorm.rma.glmm
###   qqnorm.rma.mv
### Keywords: hplot

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
qqnorm(res)

### mixed-effects model with absolute latitude as a moderator
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, mods = ~ ablat,
           data=dat.bcg)
qqnorm(res)



