library(qtl)


### Name: lodint
### Title: LOD support interval
### Aliases: lodint
### Keywords: utilities

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, chr=c(1,4))
## End(Don't show)
hyper <- calc.genoprob(hyper, step=0.5)
out <- scanone(hyper, method="hk")
lodint(out, chr=1)
lodint(out, chr=4)
lodint(out, chr=4, drop=2)
lodint(out, chr=4, expandtomarkers=TRUE)



