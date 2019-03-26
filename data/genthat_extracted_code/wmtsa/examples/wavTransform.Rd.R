library(wmtsa)


### Name: wavTransform
### Title: Constructor function for objects of class wavTransform
### Aliases: wavTransform [.wavTransform [<-.wavTransform [[.wavTransform
###   as.matrix.wavTransform boxplot.wavTransform eda.plot.wavTransform
###   plot.wavTransform plot.wavTransform.crystal print.wavTransform
###   print.summary.wavTransform wavStackPlot.wavTransform
###   summary.wavTransform reconstruct.wavTransform
### Keywords: univar

### ** Examples

## calculate a MODWT of the sunpots series and 
## verify the class 
W <- wavMODWT(sunspots)
print(class(W))

## summarize the object 
summary(W)

## reconstruct the MODWT of the sunspots series 
## and compare to the original 
sunup <- reconstruct(W)
splus2R::vecnorm(sunup - sunspots)



