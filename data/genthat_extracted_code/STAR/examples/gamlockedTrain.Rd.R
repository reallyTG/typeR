library(STAR)


### Name: gamlockedTrain
### Title: Function to Smooth a lockedTrain Object and Related Methods: The
###   Penalized Regression Spline Approach
### Aliases: gamlockedTrain print.gamlockedTrain summary.gamlockedTrain
###   plot.gamlockedTrain
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
##D slt1.3 <- gamlockedTrain(lt1.3)
##D plot(slt1.3)
##D ## do some check on the gam fit
##D summary(slt1.3)
##D gam.check(gamObj(slt1.3))
## End(Not run)


