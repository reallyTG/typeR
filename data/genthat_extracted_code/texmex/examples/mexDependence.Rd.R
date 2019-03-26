library(texmex)


### Name: mexDependence
### Title: Estimate the dependence parameters in a conditional multivariate
###   extreme values model
### Aliases: mexDependence
### Keywords: models multivariate

### ** Examples


data(winter)
mygpd <- migpd(winter , mqu=.7, penalty="none")
mexDependence(mygpd , which = "NO", dqu=.7)

# focus on 2-d example with parameter estimates on boundary of constrained parameter space:
NO.NO2 <- migpd(winter[,2:3] , mqu=.7, penalty="none")

# starting value gives estimate far from true max:
mexDependence(NO.NO2, which = "NO",dqu=0.7,start=c(0.01,0.01),
              PlotLikDo=TRUE,PlotLikTitle=c("NO2 | NO"))

# zoom in on plotting region containing maximum:
mexDependence(NO.NO2, which = "NO",dqu=0.7,start=c(0.01,0.01),
              PlotLikDo=TRUE,PlotLikTitle=c("NO2 | NO"), 
              PlotLikRange = list(a=c(0,0.8),b=c(-0.2,0.6)))

# try different starting value:
mexDependence(NO.NO2, which = "NO",dqu=0.7,start=c(0.1,0.1),
              PlotLikDo=TRUE,PlotLikTitle=c("NO2 | NO"), 
              PlotLikRange = list(a=c(0,0.8),b=c(-0.2,0.6)))





