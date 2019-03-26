library(MareyMap)


### Name: MMSpline3-class
### Title: Class "MMSpline3" Interpolation using cubic splines
### Aliases: MMSpline3-methods MMSpline3,missing-method MMSpline3
###   MMSpline3-class df<- df<-,MMSpline3,numeric-method df
###   df,MMSpline3-method gcv<- gcv<-,MMSpline3,logical-method gcv
###   gcv,MMSpline3-method createOrder,MMSpline3-method
###   interpolate,MMSpline3,MareyMap-method plot,MareyMap,MMSpline3-method
###   plotModel,MMSpline3-method plotRate,MMSpline3-method
###   query,MMSpline3,numeric-method spar<- spar<-,MMSpline3,numeric-method
###   spar spar,MMSpline3-method type<- type<-,MMSpline3,character-method
###   type type,MMSpline3-method userParam,MMSpline3-method
### Keywords: classes

### ** Examples

data(Homo_sapiens_mean)
human7 <- Homo_sapiens_mean[["Chromosome 07"]]
itr1 <- MMSpline3()
color(itr1) <- "red"
spar(itr1) <- 0.05
human7 <- human7 + itr1
plot(human7)



