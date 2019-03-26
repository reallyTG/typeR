library(timedelay)


### Name: bayesian
### Title: Estimating the time delay via the Bayesian method
### Aliases: bayesian
### Keywords: methods

### ** Examples


  # Loading datasets
  data(simple)

  # A typical quasar data set  
  head(simple)

  # Subset (data for image A) of the typical quasar data set
  lcA <- simple[, 1 : 3]

  # Another subset (data for image B) of the typical quasar data set
  # The observation times for image B are not necessarily the same as those for image A
  lcB <- simple[, c(1, 4, 5)]

  # The two subsets do not need to have the same number of observations
  # For example, here we add one more observation time for image B
  lcB <- rbind(lcB, c(290, 1.86, 0.006))

  dim(lcA)
  dim(lcB)

  ###############################################
  # Time delay estimation via Bayesian approach #
  ###############################################

  # Cubic microlensing model (m = 3)
  output = bayesian(data.lcA = lcA, data.lcB = lcB, 
                    data.flux = FALSE, theta.ini = c(0, 0.01, 200), 
                    delta.ini = 50, delta.uniform.range = c(0, 100), 
                    delta.proposal.scale = 1, 
                    tau.proposal.scale = 3, 
                    tau.prior.shape = 1, tau.prior.scale = 1,
                    sigma.prior.shape = 1, sigma.prior.scale = 2 / 10^7, 
                    asis = TRUE, micro = 3,
                    sample.size = 100, warmingup.size = 50)

  names(output)

  # hist(output$delta, 20)
  # plot(output$delta, type = "l")
  # acf(output$delta)
  # output$delta.accept
  # output$tau.accept

  # If multimodality exists, then please add two arguments:
  # multimodality = TRUE, adaptive.delta = FALSE
  # This is to prevent the Markov chain from adapting to a local mode.
  # If we know the distance between the most distant modes,
  # try the smallest value of delta.proposal.scale that still makes 
  # the Markov chain jump between those modes frequently.
  # For example, when the distance is d, then try 
  # delta.proposal.scale = d * 0.7, decreasing or increasing 0.7.

  # Graphical model checking 
  # beta.hat <- colMeans(output$beta)
  # delta.hat <- mean(output$delta)
  # time.x <- lcB[, 1] - delta.hat
  # time.covariate <- cbind(rep(1, length(time.x)), time.x, time.x^2, time.x^3)
  ##### This time.covariate is when micro = 3, a third-order polynomial regression.
  ##### With micro = 0, "time.covariate <- rep(1, length(time.x))" is used.
  # predicted <- time.covariate %*% beta.hat
  # plot(lcA[, 1], lcA[, 2], col = 2)     
  ##### Adjust the range of the x-axis by the argument of plot.
  ##### For example "xlim = c(-1, 2)" 
  # points(lcB[, 1] - delta.hat, lcB[, 2] - predicted, col = 4, pch = 1)
  # for (i in 1 : length(output$delta)) {
  #   temp.time <- c(lcA[, 1], lcB[, 1] - output$delta[i])
  #   points(sort(temp.time), output$X[i, ], 
  #          col = "gray", cex = 0.5, pch = 1, lwd = 0.01)
  # }
  # points(lcA[, 1], lcA[, 2], pch = 0, col = 2, lwd = 1)
  # points(lcB[, 1] - delta.hat, lcB[, 2] - predicted, 
  #        col = 4, pch = 1, lwd = 1)





