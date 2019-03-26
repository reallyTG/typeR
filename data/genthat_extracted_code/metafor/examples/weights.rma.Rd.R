library(metafor)


### Name: weights.rma.uni
### Title: Compute Weights for 'rma' Objects
### Aliases: weights.rma.uni weights.rma.mh weights.rma.peto
###   weights.rma.glmm weights.rma.mv
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects model
### with two moderators (absolute latitude and publication year)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, 
           mods = ~ ablat + year, data=dat.bcg)
weights(res)



