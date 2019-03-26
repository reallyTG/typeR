library(metafor)


### Name: rma.mh
### Title: Meta-Analysis via the Mantel-Haenszel Method
### Aliases: rma.mh
### Keywords: models

### ** Examples

### meta-analysis of the (log) odds ratios using the Mantel-Haenszel method
rma.mh(measure="OR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### meta-analysis of the (log) risk ratios using the Mantel-Haenszel method
rma.mh(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)



