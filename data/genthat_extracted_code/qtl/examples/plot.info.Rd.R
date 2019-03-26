library(qtl)


### Name: plotInfo
### Title: Plot the proportion of missing genotype information
### Aliases: plotInfo
### Keywords: hplot univar

### ** Examples

data(hyper)
## Don't show: 
hyper <- subset(hyper,chr=1:4)
## End(Don't show)
plotInfo(hyper,chr=c(1,4))

# save the results and view maximum missing info on each chr
info <- plotInfo(hyper)
summary(info)

plotInfo(hyper, bandcol="gray70")



