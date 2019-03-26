library(HDtweedie)


### Name: plot.HDtweedie
### Title: Plot solution paths from a "HDtweedie" object
### Aliases: plot.HDtweedie
### Keywords: models regression

### ** Examples

# load HDtweedie library
library(HDtweedie)

# load data set
data(auto)

# fit the lasso
m0 <- HDtweedie(x=auto$x,y=auto$y,p=1.5)

# make plot
plot(m0) # plots the coefficients against the log-lambda sequence

# define group index
group1 <- c(rep(1,5),rep(2,7),rep(3,4),rep(4:14,each=3),15:21)

# fit group lasso
m1 <- HDtweedie(x=auto$x,y=auto$y,group=group1,p=1.5)

# make plots
par(mfrow=c(1,3))
plot(m1) # plots the coefficients against the log-lambda sequence 
plot(m1,group=TRUE) # plots group norm against the log-lambda sequence 
plot(m1,log.l=FALSE) # plots against the lambda sequence



