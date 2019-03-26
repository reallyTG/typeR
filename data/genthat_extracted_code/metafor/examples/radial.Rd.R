library(metafor)


### Name: radial
### Title: Radial (Galbraith) Plots for 'rma' Objects
### Aliases: radial galbraith radial.rma
### Keywords: hplot

### ** Examples

### meta-analysis of the log risk ratios using a fixed-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg, method="FE")
radial(res)

### line from (0,0) with slope equal to the log risk ratio from the 4th study
abline(a=0, b=-1.44155119, lty="dotted")

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)
radial(res)



