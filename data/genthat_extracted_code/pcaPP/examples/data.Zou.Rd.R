library(pcaPP)


### Name: data.Zou
### Title: Test Data Generation for Sparse PCA examples
### Aliases: data.Zou
### Keywords: multivariate robust

### ** Examples

                   ##  data generation
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



