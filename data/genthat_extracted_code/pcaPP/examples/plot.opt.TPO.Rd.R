library(pcaPP)


### Name: plot.opt.TPO
### Title: Tradeoff Curves for Sparse PCs
### Aliases: plot.opt.TPO plot.opt.BIC
### Keywords: multivariate robust

### ** Examples


  set.seed (0)
                      ##  generate test data
  x <- data.Zou (n = 250)

  k.max <- 3          ##  max number of considered sparse PCs

                      ##  arguments for the sPCAgrid algorithm
  maxiter <- 25       ##    the maximum number of iterations
  method <- "sd"      ##    using classical estimations

                      ##  Optimizing the TPO criterion
  oTPO <- opt.TPO (x, k.max = k.max, method = method, maxiter = maxiter)

                      ##  Optimizing the BIC criterion
  oBIC <- opt.BIC (x, k.max = k.max, method = method, maxiter = maxiter)

          ##  Tradeoff Curves: Explained Variance vs. sparseness
  par (mfrow = c (2, k.max))
  for (i in 1:k.max)        plot (oTPO, k = i)
  for (i in 1:k.max)        plot (oBIC, k = i)

          ##  Explained Variance vs. lambda
  par (mfrow = c (2, k.max))
  for (i in 1:k.max)        plot (oTPO, k = i, f.x = "lambda")
  for (i in 1:k.max)        plot (oBIC, k = i, f.x = "lambda")



