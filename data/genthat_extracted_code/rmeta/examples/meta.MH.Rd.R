library(rmeta)


### Name: meta.MH
### Title: Fixed effects (Mantel-Haenszel) meta-analysis
### Aliases: meta.MH summary.meta.MH print.meta.MH print.summary.meta.MH
###   plot.meta.MH
### Keywords: htest hplot

### ** Examples

data(catheter)
a <- meta.MH(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
             names=Name, subset=c(13,6,5,3,7,12,4,11,1,8,10,2))
a
summary(a)
plot(a)
d <- meta.MH(n.trt, n.ctrl, inf.trt, inf.ctrl, data=catheter,
             names=Name, subset=c(13,6,3,12,4,11,1,14,8,10,2))
d
summary(d)
## plot with par("fg")
plot(d, colors=meta.colors(NULL))



