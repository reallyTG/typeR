library(rmeta)


### Name: meta.DSL
### Title: Random effects (DerSimonian-Laird) meta-analysis
### Aliases: meta.DSL summary.meta.DSL print.meta.DSL
###   print.summary.meta.DSL plot.meta.DSL
### Keywords: htest hplot

### ** Examples

data(catheter)
b <- meta.DSL(n.trt, n.ctrl, col.trt, col.ctrl, data=catheter,
              names=Name, subset=c(13,6,5,3,7,12,4,11,1,8,10,2))
b
summary(b)
plot(b)
e <- meta.DSL(n.trt, n.ctrl, inf.trt, inf.ctrl, data=catheter,
              names=Name, subset=c(13,6,3,12,4,11,1,14,8,10,2))
e
summary(e)
##tasteless
plot(e, colors=meta.colors(summary="green",lines="purple",box="orange"))



