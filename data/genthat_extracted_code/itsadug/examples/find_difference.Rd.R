library(itsadug)


### Name: find_difference
### Title: Return the regions in which the smooth is significantly
###   different from zero.
### Aliases: find_difference

### ** Examples

data(simdat)

# Use aggregate to calculate mean and standard deviation per timestamp:
avg <- aggregate(simdat$Y, by=list(Time=simdat$Time),
    function(x){c(mean=mean(x), sd=sd(x))})
head(avg)
# Note that column x has two values in each row:
head(avg$x)
head(avg$x[,1])

# Plot line and standard deviation:
emptyPlot(range(avg$Time), c(-20,20), h0=0)
plot_error(avg$Time, avg$x[,'mean'], avg$x[,'sd'], 
   shade=TRUE, lty=3, lwd=3)

# Show difference with 0:
x <- find_difference(avg$x[,'mean'], avg$x[,'sd'], xVals=avg$Time)
# Add arrows:
abline(v=c(x$start, x$end), lty=3, col='red')
arrows(x0=x$start, x1=x$end, y0=-5, y1=-5, code=3, length=.1, col='red')



