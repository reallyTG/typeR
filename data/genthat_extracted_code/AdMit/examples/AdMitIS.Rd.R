library(AdMit)


### Name: AdMitIS
### Title: Importance Sampling using an Adaptive Mixture of Student-t
###   Distributions as the Importance Density
### Aliases: AdMitIS
### Keywords: htest

### ** Examples

  ## NB : Low number of draws for speedup. Consider using more draws!
  ## Gelman and Meng (1991) kernel function
  GelmanMeng <- function(x, A = 1, B = 0, C1 = 3, C2 = 3, log = TRUE)
  {
    if (is.vector(x))
      x <- matrix(x, nrow = 1)
    r <- -.5 * (A * x[,1]^2 * x[,2]^2 + x[,1]^2 + x[,2]^2
              - 2 * B * x[,1] * x[,2] - 2 * C1 * x[,1] - 2 * C2 * x[,2])
    if (!log)
      r <- exp(r)
    as.vector(r)
  }

  ## Run the AdMit function to fit the mixture approximation
  set.seed(1234)
  outAdMit <- AdMit(KERNEL = GelmanMeng, 
                    mu0 = c(0.0, 0.1), control = list(Ns = 1e4))

  ## Use importance sampling with the mixture approximation as the
  ## importance density
  outAdMitIS <- AdMitIS(N = 1e4, KERNEL = GelmanMeng, mit = outAdMit$mit)
  print(outAdMitIS)



