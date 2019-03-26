library(pcaPP)


### Name: PCdiagplot
### Title: Diagnostic plot for principal components
### Aliases: PCdiagplot
### Keywords: robust

### ** Examples

  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(85, rep(0, 6), diag(c(5, rep(1,5)))),
             rmvnorm( 15, c(0, rep(20, 5)), diag(rep(1, 6))))
  # Here we calculate the principal components with PCAgrid
  pcrob <- PCAgrid(x, k=6)
  resrob <- PCdiagplot(x,pcrob,plotbw=FALSE)

  # compare with classical method:
  pcclass <- PCAgrid(x, k=6, method="sd")
  resclass <- PCdiagplot(x,pcclass,plotbw=FALSE)



