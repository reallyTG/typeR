library(qtlcharts)


### Name: iplotPXG
### Title: Interactive phenotype x genotype plot
### Aliases: iplotPXG
### Keywords: hplot

### ** Examples

library(qtl)
data(hyper)
marker <- sample(markernames(hyper), 1)
## No test: 
iplotPXG(hyper, marker)

# different colors
iplotPXG(hyper, marker, chartOpts=list(pointcolor=c("black", "gray")))
## End(No test)




