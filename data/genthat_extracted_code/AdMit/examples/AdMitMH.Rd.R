library(AdMit)


### Name: AdMitMH
### Title: Independence Chain Metropolis-Hastings Algorithm using an
###   Adaptive Mixture of Student-t Distributions as the Candidate Density
### Aliases: AdMitMH
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

  ## Run M-H using the mixture approximation as the candidate density
  outAdMitMH <- AdMitMH(N = 1e4, KERNEL = GelmanMeng, mit = outAdMit$mit)
  options(digits = 4, max.print = 40)
  print(outAdMitMH)

  ## Use functions provided by the package coda to obtain
  ## quantities of interest for the density whose kernel is 'GelmanMeng'
  library("coda")
  draws <- as.mcmc(outAdMitMH$draws)
  draws <- window(draws, start = 1001)
  colnames(draws) <- c("X1", "X2")
  summary(draws)
  summary(draws)$stat[,3]^2 / summary(draws)$stat[,4]^2 ## RNE
  plot(draws)



