library(extracat)


### Name: qBCI
### Title: Quantile BCI
### Aliases: qBCI.data.frame qBCI.default qBCI

### ** Examples

## Not run: 
##D qBCI(rnorm(100),runif(100))
##D 
##D 
##D # non-functional relationship:
##D x1 <- runif(500,0,10)
##D x2 <- runif(500,0,10)
##D y1 <- x1+rnorm(500,sd=1) 
##D y2 <- 10-x2+rnorm(500,sd=1) 
##D 
##D x <- c(x1,x2)
##D y <- c(y1,y2)
##D 
##D plot(x,y, pch = 19)
##D 
##D wdcor(x,y)
##D 1 - qBCI(x,y)
##D 
##D 
##D y1 <- x1+rnorm(500,sd=0.1) 
##D y2 <- 10-x2+rnorm(500,sd=0.1) 
##D 
##D x <- c(x1,x2)
##D y <- c(y1,y2)
##D 
##D plot(x,y, pch = 19)
##D 
##D wdcor(x,y)
##D 1 - qBCI(x,y)
##D 
##D # or a quadratic curve:
##D test <- sapply(seq(0,4,0.2),function(s){
##D x <- runif(200,-1,1)
##D y <- 5+12*x^2+rnorm(200,sd=s)
##D return(c(cor(x,y),
##D wdcor(x,y),
##D 1 - qBCI(x,y)))
##D })
##D 
##D 
##D plot(test[3,],type="l", ylim=c(-0.2,1))
##D lines(test[1,], col = 2, lwd = 2)
##D 
##D lines(test[2,], col = 3, lwd = 2)
##D 
## End(Not run)




