library(fsdaR)


### Name: fsmult
### Title: Gives an automatic outlier detection procedure in multivariate
###   analysis
### Aliases: fsmult

### ** Examples

 data(hbk)
 (out <- fsmult(hbk[,1:3]))
 class(out)
 summary(out)

 ## Not run: 
##D 
##D  ##  Generate contaminated data (200,3)
##D  n <- 200
##D  p <- 3
##D  set.seed(123456)
##D  X <- matrix(rnorm(n*p), nrow=n)
##D  Xcont <- X
##D  Xcont[1:5, ] <- Xcont[1:5,] + 3
##D 
##D  out1 <- fsmult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
##D  names(out1)
##D 
##D  (out1 <- fsmult(Xcont, trace=TRUE, plot=TRUE))    # identical to plot=1
##D 
##D  ## plot=1 - minimum MD with envelopes based on n observations
##D  ##  and the scatterplot matrix with the outliers highlighted
##D  (out1 <- fsmult(Xcont, trace=TRUE, plot=1))
##D 
##D  ## plot=2 - additional plots of envelope resuperimposition
##D  (out1 <- fsmult(Xcont, trace=TRUE, plot=2))
##D 
##D  ## plots is a list: plots showing envelope superimposition in normal coordinates.
##D  (out1 <- fsmult(Xcont, trace=TRUE, plot=list(ncoord=1)))
##D 
##D  ##  Choosing an initial subset formed by the three observations with
##D  ##  the smallest Mahalanobis Distance.
##D 
##D  (out1 <- fsmult(Xcont, m0=5, crit="md", trace=TRUE))
##D 
##D  ## fsmult() with monitoring
##D  (out2 <- fsmult(Xcont, monitoring=TRUE, trace=TRUE))
##D  names(out2)
##D 
##D  ## Monitor the exceedances from m=200 without showing plots.
##D  n <- 1000
##D  p <- 10
##D  Y <- matrix(rnorm(10000), ncol=10)
##D  (out <- fsmult(Y, init=200))
##D 
##D  ##  Forgery Swiss banknotes examples.
##D 
##D  data(swissbanknotes)
##D 
##D  ## Monitor the exceedances of Minimum Mahalanobis Distance
##D  (out1 <- fsmult(swissbanknotes[101:200,], plot=1))
##D 
##D  ##  Control minimum and maximum on the x axis
##D  (out1 <- fsmult(swissbanknotes[101:200,], plot=list(xlim=c(60,90))))
##D 
##D  ##  Monitor the exceedances of Minimum Mahalanobis Distance using
##D  ##  normal coordinates for mmd.
##D  (out1 <- fsmult(swissbanknotes[101:200,], plot=list(ncoord=1)))
##D  
## End(Not run)



