library(McSpatial)


### Name: qregbmat 
### Title: Quantile Regression for Multiple Quantiles
### Aliases: 'qregbmat '
### Keywords: Quantile Regression Machado-Mata

### ** Examples


par(ask=TRUE)
data(matchdata)
matchdata$age <- matchdata$year - matchdata$yrbuilt 
bmat <- qregbmat(lnprice~lnland+lnbldg+age+factor(year), data=matchdata,
  graph.factor=TRUE)
summary(bmat)



