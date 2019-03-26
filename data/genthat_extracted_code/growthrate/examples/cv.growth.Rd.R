library(growthrate)


### Name: cv.growth
### Title: cross validation error
### Aliases: cv.growth

### ** Examples

## Not run: 
##D     ## example using the height data provided in the package
##D     ## there are 7 observation times (age in years):
##D     ## WARNING: cv.growth is time-consuming. This example uses only part of the data.
##D     data(height_data);
##D     ht = height_data[1:100,];
##D     tobs=c(0,1/3,2/3,1,3,4,7);
##D     cvg=cv.growth(ht, tobs, 100, 21, 1, 5, 2);
##D 
##D     ## Plot of the cross validation error as a function of sigma:
##D     plot(cvg$sigmavec, cvg$CVer, xlab="Sigma", ylab="Cross validation error");
##D 
##D     ## Value of sigma that minimizes the cross validation error:
##D     sigmaopt=cvg$sigmavec[which(cvg$CVer==min(cvg$CVer))]; 	
## End(Not run)



