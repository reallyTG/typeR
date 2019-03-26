library(pcaPP)


### Name: PCAgrid
### Title: (Sparse) Robust Principal Components using the Grid search
###   algorithm
### Aliases: PCAgrid sPCAgrid
### Keywords: multivariate robust

### ** Examples

  # multivariate data with outliers
  library(mvtnorm)
  x <- rbind(rmvnorm(200, rep(0, 6), diag(c(5, rep(1,5)))),
             rmvnorm( 15, c(0, rep(20, 5)), diag(rep(1, 6))))
  # Here we calculate the principal components with PCAgrid
  pc <- PCAgrid(x)
  # we could draw a biplot too:
  biplot(pc)
  # now we want to compare the results with the non-robust principal components
  pc <- princomp(x)
  # again, a biplot for comparison:
  biplot(pc)

  ##  Sparse loadings
  set.seed (0)
  x <- data.Zou ()

                   ##  applying PCA
  pc <-  princomp (x)
                   ##  the corresponding non-sparse loadings
  unclass (pc$load[,1:3])
  pc$sdev[1:3]

                   ##  lambda as calculated in the opt.TPO - example
  lambda <- c (0.23, 0.34, 0.005)
                   ##  applying sparse PCA
  spc <- sPCAgrid (x, k = 3, lambda = lambda, method = "sd")
  unclass (spc$load)
  spc$sdev[1:3]

                   ## comparing the non-sparse and sparse biplot
  par (mfrow = 1:2)
  biplot (pc, main = "non-sparse PCs")
  biplot (spc, main = "sparse PCs")



