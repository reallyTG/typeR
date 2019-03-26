library(metafor)


### Name: trimfill
### Title: Trim and Fill Analysis for 'rma.uni' Objects
### Aliases: trimfill trimfill.rma.uni
### Keywords: models

### ** Examples

### meta-analysis of the log risk ratios using a fixed-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, method="FE")
res.tf <- trimfill(res)
res.tf
funnel(res.tf)

### estimator "R0" also provides test
res.tf <- trimfill(res, estimator="R0")
res.tf

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
res.tf <- trimfill(res)
res.tf
funnel(res.tf)



