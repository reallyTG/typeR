library(metafor)


### Name: labbe
### Title: L'Abbe Plots for 'rma' Objects
### Aliases: labbe labbe.rma
### Keywords: hplot

### ** Examples

### meta-analysis of the log risk ratios using a random-effects model
res <- rma(measure="RR", ai=tpos, bi=tneg, ci=cpos, di=cneg, data=dat.bcg)

### default plot
labbe(res)

### funnel plot with risk values on the x- and y-axis
labbe(res, transf=exp)



