library(qtl)


### Name: cim
### Title: Composite interval mapping
### Aliases: cim
### Keywords: models

### ** Examples

data(hyper)
hyper <- calc.genoprob(hyper, step=2.5)
## Don't show: 
hyper <- subset(hyper, chr=c(1,4,6,15))
## End(Don't show)

out <- scanone(hyper)
out.cim <- cim(hyper, n.marcovar=3)
plot(out, out.cim, chr=c(1,4,6,15), col=c("blue", "red"))

add.cim.covar(out.cim, chr=c(1,4,6,15))



