library(feature)


### Name: plot.fs
### Title: Feature signficance plot for 1- to 3-dimensional data
### Aliases: plot.fs
### Keywords: hplot

### ** Examples

## See ? featureSignif for uni- and bivariate examples
## Trivariate example
## No test: 
data(earthquake)
earthquake[,3] <- -log10(-earthquake[,3])
fs <- featureSignif(earthquake, scaleData=TRUE, bw=c(0.06, 0.06, 0.05))
plot(fs, addKDE=FALSE, addSignifCurvRegion=TRUE)
## End(No test)



