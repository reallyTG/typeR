library(evian)


### Name: densityPlot
### Title: Plot profile likelihood density for a single SNP.
### Aliases: densityPlot

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
ycol=6, covariateCol=c(5,7:9), robust=FALSE, model="additive", m=1000,
kcutoff = c(32,100), multiThread=1)
## End(No test)
# Plot the density for rs912
densityPlot(dList=rst1,snpName='rs912')





