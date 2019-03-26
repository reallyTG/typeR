library(EnvStats)


### Name: simulateMvMatrix
### Title: Simulate a Multivariate Matrix Based on a Specified Rank
###   Correlation Mat
### Aliases: simulateMvMatrix
### Keywords: distribution datagen

### ** Examples

  # Generate 5 observations from a standard bivariate normal distribution 
  # with a rank correlation matrix (approximately) equal to the 2 x 2 
  # identity matrix, using simple random sampling for each 
  # marginal distribution.

  simulateMvMatrix(5, seed = 47) 
  #           Var.1       Var.2
  #[1,]  0.01513086  0.03960243
  #[2,] -1.08573747  0.09147291
  #[3,] -0.98548216  0.49382018
  #[4,] -0.25204590 -0.92245624
  #[5,] -1.46575030 -1.82822917

  #==========

  # Look at the observed rank correlation matrix for 100 observations 
  # from a standard bivariate normal distribution with a rank correlation matrix 
  # (approximately) equal to the 2 x 2 identity matrix. Compare this observed 
  # rank correlation matrix with the observed rank correlation matrix based on 
  # generating two independent sets of standard normal random numbers.  
  # Note that the cross-correlation is closer to 0 for the matrix created with 
  # simulateMvMatrix.

  cor(simulateMvMatrix(100, seed = 47), method = "spearman") 
  #             Var.1        Var.2
  #Var.1  1.000000000 -0.005976598
  #Var.2 -0.005976598  1.000000000

  cor(matrix(simulateVector(200, seed = 47), 100 , 2), method = "spearman") 
  #            [,1]        [,2]
  #[1,]  1.00000000 -0.05374137
  #[2,] -0.05374137  1.00000000

  #==========

  # Generate 1000 observations from a bivariate distribution, where the first 
  # distribution is a normal distribution with parameters mean=10 and sd=2, 
  # the second distribution is a lognormal distribution with parameters 
  # mean=10 and cv=1, and the desired rank correlation between the two 
  # distributions is 0.8.  Look at the observed rank correlation matrix, and 
  # plot the results.

  mat <- simulateMvMatrix(1000, 
    distributions = c(N.10.2 = "norm", LN.10.1 = "lnormAlt"), 
    param.list = list(N.10.2  = list(mean=10, sd=2), 
                      LN.10.1 = list(mean=10, cv=1)), 
    cor.mat = matrix(c(1, .8, .8, 1), 2, 2), seed = 47)

  round(cor(mat, method = "spearman"), 2) 
  #        N.10.2 LN.10.1
  #N.10.2    1.00    0.78
  #LN.10.1   0.78    1.00

  dev.new()
  plot(mat, xlab = "Observations from N(10, 2)", 
    ylab = "Observations from LN(mean=10, cv=1)", 
    main = "Lognormal vs. Normal Deviates with Rank Correlation 0.8")

  #----------

  # Repeat the last example, but use Latin Hypercube sampling for both 
  # distributions. Note the wider range on the y-axis.

  mat.LHS <- simulateMvMatrix(1000, 
    distributions = c(N.10.2 = "norm", LN.10.1 = "lnormAlt"), 
    param.list = list(N.10.2  = list(mean=10, sd=2), 
                      LN.10.1 = list(mean=10, cv=1)), 
    cor.mat = matrix(c(1, .8, .8, 1), 2, 2), 
    sample.method = "LHS", seed = 298)

  round(cor(mat.LHS, method = "spearman"), 2) 
  #        N.10.2 LN.10.1
  #N.10.2    1.00    0.79
  #LN.10.1   0.79    1.00

  dev.new()
  plot(mat.LHS, xlab = "Observations from N(10, 2)", 
    ylab = "Observations from LN(mean=10, cv=1)", 
    main = paste("Lognormal vs. Normal Deviates with Rank Correlation 0.8",
      "(Latin Hypercube Sampling)", sep = "\n"))

  #==========

  # Generate 1000 observations from a multivariate distribution, where the 
  # first distribution is a normal distribution with parameters 
  # mean=10 and sd=2, the second distribution is a lognormal distribution 
  # with parameters mean=10 and cv=1, the third distribution is a beta 
  # distribution with parameters shape1=2 and shape2=3, and the fourth 
  # distribution is an empirical distribution of 100 observations that 
  # we'll generate from a Pareto distribution with parameters 
  # location=10 and shape=2. Set the desired rank correlation matrix to:

  cor.mat <- matrix(c(1, .8, 0, .5, .8, 1, 0, .7, 
    0, 0, 1, .2, .5, .7, .2, 1), 4, 4) 

  cor.mat 
  #     [,1] [,2] [,3] [,4] 
  #[1,]  1.0  0.8  0.0  0.5 
  #[2,]  0.8  1.0  0.0  0.7 
  #[3,]  0.0  0.0  1.0  0.2 
  #[4,]  0.5  0.7  0.2  1.0

  # Use Latin Hypercube sampling for each variable, look at the observed 
  # rank correlation matrix, and plot the results.

  pareto.rns <- simulateVector(100, "pareto", 
    list(location = 10, shape = 2), sample.method = "LHS", 
    seed = 56)

  mat <- simulateMvMatrix(1000, 
    distributions = c(Normal = "norm", Lognormal = "lnormAlt", 
      Beta = "beta", Empirical = "emp"), 
    param.list = list(Normal = list(mean=10, sd=2), 
                      Lognormal = list(mean=10, cv=1), 
                      Beta = list(shape1 = 2, shape2 = 3), 
                      Empirical = list(obs = pareto.rns)), 
    cor.mat = cor.mat, seed = 47, sample.method = "LHS")

  round(cor(mat, method = "spearman"), 2) 
  #          Normal Lognormal  Beta Empirical
  #Normal      1.00      0.78 -0.01      0.47
  #Lognormal   0.78      1.00 -0.01      0.67
  #Beta       -0.01     -0.01  1.00      0.19
  #Empirical   0.47      0.67  0.19      1.00

  dev.new()
  pairs(mat)

  #==========

  # Clean up
  #---------
  rm(mat, mat.LHS, pareto.rns)
  graphics.off()



