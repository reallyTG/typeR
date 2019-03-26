library(TeachingDemos)


### Name: USCrimes
### Title: US Crime Statistics
### Aliases: USCrimes
### Keywords: datasets

### ** Examples

data(USCrimes)
## maybe str(USCrimes)

# plot time series/sparkline for each state
if(require(maptools)) {
	data(state.vbm)
	plot(state.vbm)

	tmp.x <- state.vbm$center_x
	tmp.x <- c( tmp.x[1:8], 147, tmp.x[9:43], 83, tmp.x[44:50] )
	tmp.y <- state.vbm$center_y
	tmp.y <- c( tmp.y[1:8], 45, tmp.y[9:43], -18, tmp.y[44:50] )
	tmp.r <- range( USCrimes[,,'ViolentCrimeRate'], na.rm=TRUE)
	for(i in 1:52) {
		subplot( plot(1960:2010, USCrimes[i,,'ViolentCrimeRate'],
					ann=FALSE, bty='n', type='l', axes=FALSE),
			tmp.x[i], tmp.y[i], size=c(0.2,0.2) )
	}
}


## Gapminder style animation over time
if( interactive() ) {
x.r <- range( USCrimes[-c(9,45),,'Population'], na.rm=TRUE )
y.r <- range( USCrimes[-c(9,45),,'PropertyCrimeRate'], na.rm=TRUE )

tmpfun <- function(Year=1960, ... ) {
	y <- as.character(Year)
	plot( USCrimes[-c(9,45),y,'Population'],
		 USCrimes[-c(9,45),y,'PropertyCrimeRate'],
		type='n', xlab='log Population',
		ylab='Property Crime Rate',
		main=y, xlim=x.r, ylim=y.r, log='x' )
	text( USCrimes[-c(9,45),y,'Population'],
		 USCrimes[-c(9,45),y,'PropertyCrimeRate'],
		state.abb, ... )
}

tmp.list <- list( Year=list('animate', from=1960, to=2010, delay=250) )

tmpcol <- c('blue','darkgreen','red','purple')[state.region]
tkexamp( tmpfun(col=tmpcol), tmp.list )
}



