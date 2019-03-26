library(qtl)


### Name: replacemap.scantwo
### Title: Replace the genetic map in QTL mapping results with an alternate
###   map
### Aliases: replacemap.scantwo
### Keywords: manip

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper, chr=18:19)
## End(Don't show)
origmap <- pull.map(hyper)
newmap <- est.map(hyper)
hyper <- replacemap(hyper, newmap)
hyper <- calc.genoprob(hyper, step=0)
out <- scantwo(hyper, method="hk")
out.rev <- replacemap(out, origmap)



