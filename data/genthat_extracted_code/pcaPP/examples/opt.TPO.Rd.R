library(pcaPP)


### Name: opt.TPO
### Title: Model Selection for Sparse (Robust) Principal Components
### Aliases: opt.TPO opt.BIC
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

  oTPO$pc             ##  the model selected by opt.TPO
  oTPO$pc$load        ##  and the according sparse loadings.

                      ##  Optimizing the BIC criterion
  oBIC <- opt.BIC (x, k.max = k.max, method = method, maxiter = maxiter)

  oBIC$pc[[1]]        ##  the first model selected by opt.BIC (k = 1)

          ##  Tradeoff Curves: Explained Variance vs. sparseness
  par (mfrow = c (2, k.max))
  for (i in 1:k.max)        plot (oTPO, k = i)
  for (i in 1:k.max)        plot (oBIC, k = i)

          ##  Tradeoff Curves: Explained Variance vs. lambda
  par (mfrow = c (2, k.max))
  for (i in 1:k.max)        plot (oTPO, k = i, f.x = "lambda")
  for (i in 1:k.max)        plot (oBIC, k = i, f.x = "lambda")

          ##  Objective function vs. lambda
  par (mfrow = c (2, k.max))
  for (i in 1:k.max)        objplot (oTPO, k = i)
  for (i in 1:k.max)        objplot (oBIC, k = i)



