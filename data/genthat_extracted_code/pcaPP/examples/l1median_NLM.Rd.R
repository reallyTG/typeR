library(pcaPP)


### Name: l1median_NLM
### Title: Multivariate L1 Median
### Aliases: l1median_NM l1median_CG l1median_BFGS l1median_NLM
###   l1median_HoCr l1median_VaZh
### Keywords: multivariate robust

### ** Examples


  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(200, rep(0, 4), diag(c(1, 1, 2, 2))), 
             rmvnorm( 50, rep(3, 4), diag(rep(2, 4))))

  l1median_NM (x)$par
  l1median_CG (x)$par
  l1median_BFGS (x)$par
  l1median_NLM (x)$par
  l1median_HoCr (x)$par
  l1median_VaZh (x)$par

  # compare with coordinate-wise median:
  apply(x,2,median)



