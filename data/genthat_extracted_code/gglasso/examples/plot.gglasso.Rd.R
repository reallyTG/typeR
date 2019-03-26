library(gglasso)


### Name: plot.gglasso
### Title: Plot solution paths from a "gglasso" object
### Aliases: plot.gglasso
### Keywords: models regression

### ** Examples

# load gglasso library
library(gglasso)

# load data set
data(bardet)

# define group index
group <- rep(1:20,each=5)

# fit group lasso
m1 <- gglasso(x=bardet$x,y=bardet$y,group=group,loss="ls")

# make plots
par(mfrow=c(1,3))
plot(m1) # plots the coefficients against the log-lambda sequence 
plot(m1,group=TRUE) # plots group norm against the log-lambda sequence 
plot(m1,log.l=FALSE) # plots against the lambda sequence



