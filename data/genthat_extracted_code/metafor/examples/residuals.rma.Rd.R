library(metafor)


### Name: residuals.rma
### Title: Residual Values based on 'rma' Objects
### Aliases: residuals.rma rstandard.rma.uni rstandard.rma.mh
###   rstandard.rma.mv rstandard.rma.peto rstudent.rma.uni rstudent.rma.mh
###   rstudent.rma.peto
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
rstudent(res)

### mixed-effects model with absolute latitude as a moderator
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, mods = ~ ablat,
           data=dat.bcg)
rstudent(res)



