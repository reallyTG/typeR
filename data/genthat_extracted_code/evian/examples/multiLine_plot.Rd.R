library(evian)


### Name: multiLine_plot
### Title: Plot methods for multiple likelihood intervals in a genomic
###   region.
### Aliases: multiLine_plot

### ** Examples

data(eviandata_linear)
data(evianmap_linear)
## Don't show: 
rst1=evian_linear(data=eviandata_linear, bim=evianmap_linear, xcols=10:ncol(eviandata_linear),
ycol=6, covariateCol=c(5,7:9), robust=FALSE, model="additive", m=100, lolim=-0.4,
hilim=0.4, kcutoff = c(32,100), multiThread=1)
## End(Don't show)
## No test: 
rst1=evian_linear(data=eviandata_linear, bim=evianmap_linear, xcols=10:ncol(eviandata_linear),
ycol=6, covariateCol=c(5,7:9), robust=FALSE, model="additive",
m=1000, kcutoff = c(32,100), multiThread=1)
## End(No test)

# Plot the LIs for all 10 SNPs
multiLine_plot(dList=rst1)





