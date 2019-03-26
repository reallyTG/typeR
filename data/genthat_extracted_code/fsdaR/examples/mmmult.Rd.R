library(fsdaR)


### Name: mmmult
### Title: Computes MM estimators in multivariate analysis with auxiliary
###   S-scale
### Aliases: mmmult

### ** Examples


 data(hbk)
 (out <- mmmult(hbk[,1:3]))
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
##D  out1 <- mmmult(Xcont, trace=TRUE)           # no plots (plot defaults to FALSE)
##D  names(out1)
##D 
##D  ## plot=TRUE - generates: (1) a plot of Mahalanobis distances against
##D  ##    index number. The confidence level used to draw the confidence bands for
##D  ##    the MD is given by the input option conflev. If conflev is
##D  ##    not specified a nominal 0.975 confidence interval will be used and
##D  ##    (2) a scatter plot matrix with the outliers highlighted.
##D 
##D  (out1 <- mmmult(Xcont, trace=TRUE, plot=TRUE))
##D 
##D  ## plots is a list: the spm shows the labels of the outliers.
##D  (out1 <- mmmult(Xcont, trace=TRUE, plot=list(labeladd="1")))
##D 
##D  ## plots is a list: the spm uses the variable names provided by 'nameY'.
##D  (out1 <- mmmult(Xcont, trace=TRUE, plot=list(nameY=c("A", "B", "C"))))
##D 
##D  ## mmmult() with monitoring
##D  (out2 <- mmmult(Xcont, monitoring=TRUE, trace=TRUE))
##D  names(out2)
##D 
##D  ##  Forgery Swiss banknotes examples.
##D 
##D  data(swissbanknotes)
##D 
##D  (out1 <- mmmult(swissbanknotes[101:200,], plot=TRUE))
##D 
##D  (out1 <- mmmult(swissbanknotes[101:200,], plot=list(labeladd="1")))
##D  
## End(Not run)



