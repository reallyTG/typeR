library(hydroTSM)


### Name: dwi
### Title: Days with Information
### Aliases: dwi dwi.default dwi.zoo dwi.data.frame dwi.matrix
### Keywords: manip

### ** Examples

## Loading the SanMartino precipitation data
data(SanMartinoPPts)
x <- SanMartinoPPts

## Not run: 
##D ## Days with information per year
##D dwi(x)
##D 
##D ## Days with information per month per year.
##D dwi(x, out.unit="mpy")
## End(Not run)

###########
## Not run: 
##D ## Loading the monthly time series of precipitation within the Ebro River basin.
##D data(EbroPPtsMonthly)
##D 
##D ## Months with information per year in the 9 first stations of 'EbroPPtsMonthly'
##D a <- dwi(EbroPPtsMonthly[,1:10], out.unit="years", dates=1)
##D 
##D ## Before plotting the results in 'a', and just for obtaining a more interesting
##D ## plot, 70 random numbers (between 1 and 11) are introduced in 'a'
##D a[sample(length(a), size = 70)] <- rep(1:11, length=70)
##D 
##D ## Plotting the amount of months with information per year in each station
##D matrixplot(a, var.type="Days", main="Number of months with info per year")
## End(Not run)



