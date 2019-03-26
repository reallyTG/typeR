library(feature)


### Name: featureSignif
### Title: Feature significance for kernel density estimation
### Aliases: featureSignif
### Keywords: smooth

### ** Examples

## Univariate example
data(earthquake)
eq3 <- -log10(-earthquake[,3])
fs <- featureSignif(eq3, bw=0.1)
plot(fs, addSignifGradRegion=TRUE)

## Bivariate example
library(MASS)
data(geyser)
fs <- featureSignif(geyser)
plot(fs, addKDE=FALSE, addData=TRUE)  ## data only
plot(fs, addKDE=TRUE)                 ## KDE plot only
plot(fs, addSignifGradRegion=TRUE)    
plot(fs, addKDE=FALSE, addSignifCurvRegion=TRUE)
plot(fs, addSignifCurvData=TRUE, curvCol="cyan")



