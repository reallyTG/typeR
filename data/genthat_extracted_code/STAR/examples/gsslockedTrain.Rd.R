library(STAR)


### Name: gsslockedTrain
### Title: Function to Smooth a lockedTrain Object and Related Methods: The
###   Smoothing Spline Approach
### Aliases: gsslockedTrain gsslockedTrain0 print.gsslockedTrain
###   print.gsslockedTrain0 summary.gsslockedTrain summary.gsslockedTrain0
###   plot.gsslockedTrain plot.gsslockedTrain0
### Keywords: models smooth regression

### ** Examples

## Not run: 
##D ## load e070528spont data set
##D data(e070528spont)
##D ## create a lockedTrain object with neuron 1 as reference
##D ## and neuron 3 as test up to lags of +/- 250 ms
##D lt1.3 <- lockedTrain(e070528spont[[1]],e070528spont[[3]],laglim=c(-1,1)*0.25)
##D ## look at the cross raster plot
##D lt1.3
##D ## build a histogram of it using a 10 ms bin width
##D hist(lt1.3,bw=0.01)
##D ## do it the smooth way
##D slt1.3 <- gsslockedTrain(lt1.3)
##D plot(slt1.3)
##D ## do some check on the gss fit
##D summary(slt1.3)
##D 
##D ## do the same with gsslockedTrain0
##D slt1.3 <- gsslockedTrain0(lt1.3)
##D plot(slt1.3)
##D ## do some check on the gss fit
##D summary(slt1.3)
## End(Not run)


