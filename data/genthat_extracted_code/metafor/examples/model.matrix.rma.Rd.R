library(metafor)


### Name: model.matrix.rma
### Title: Model Matrix for 'rma' Objects
### Aliases: model.matrix.rma
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a mixed-effects meta-regression model
### with multiple moderators (absolute latitude, publication year, and allocation method)
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg,
           mods = ~ ablat + year + alloc, data=dat.bcg)
model.matrix(res)



