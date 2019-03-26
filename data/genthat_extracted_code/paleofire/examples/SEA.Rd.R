library(paleofire)


### Name: SEA
### Title: Superposed Epoch Analysis
### Aliases: SEA

### ** Examples

## Not run: 
##D ## Generate some fake data
##D set.seed(1)
##D n <- 100 # number of data points
##D t <- seq(0,4*pi,,100)
##D a <- 3
##D b <- 2
##D c.unif <- runif(n)
##D amp <- 4
##D 
##D # generate data and calculate "y"
##D set.seed(1)
##D y1 <- a*sin(b*t)+c.unif*amp # add uniform error
##D 
##D # SEA applied to fake dendrochronological data in CE
##D plot(rev(seq(1901,2000,1)), y1, t="l", ylim=range(y1)*c(1.2))
##D y=c(1923,1948,1972,1995)
##D points(y,rep(0,length(y)))
##D x=data.frame(rev(seq(1901,2000,1)),value=y1)
##D lag=10
##D 
##D #Perform SEA
##D res=SEA(x, y, lag, b = NULL, conf = c(0.05, 0.95), nboot = 1000, age="CE")
##D plot(res,xlim=c(-10,10),xlab="lag",ylab="Composite mean")
##D 
##D # SEA applied to fake paleoecological data in BP
##D plot(seq(-50,49,1), y1, t="l", ylim=range(y1)*c(1.2),xlim=c(50,-50))
##D y=1950-c(1923,1948,1972,1995)
##D points(y,rep(0,length(y)))
##D x=data.frame(seq(-50,49,1),value=y1)
##D # Perform SEA
##D res=SEA(x, y, lag, b = NULL, conf = c(0.05, 0.95), nboot = 1000, age="BP")
##D plot(res,xlim=c(-10,10),xlab="lag",ylab="Composite mean")
## End(Not run)



