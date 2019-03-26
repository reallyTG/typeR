library(prim)


### Name: plot.prim
### Title: PRIM plot for multivariate data
### Aliases: plot.prim
### Keywords: hplot

### ** Examples

## see ?predict.prim for bivariate example
## trivariate example
data(quasiflow)
qf <- quasiflow[1:1000,1:3]
qf.label <- quasiflow[1:1000,4]
thr <- c(0.25, -0.3)
qf.prim <- prim.box(x=qf, y=qf.label, threshold=thr, threshold.type=0)
plot(qf.prim)



