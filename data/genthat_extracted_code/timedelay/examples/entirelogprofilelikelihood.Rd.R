library(timedelay)


### Name: entirelogprofilelikelihood
### Title: Calculating the entire profilel likelihood curve over the given
###   grid values of the time delay
### Aliases: entirelogprofilelikelihood
### Keywords: methods

### ** Examples


  # Loading datasets
  data(simple)
  head(simple)

  ################################################
  # Time delay estimation via profile likelihood #
  ################################################


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

  ###### The entire profile likelihood values on the grid of values of the time delay.

  # Cubic microlensing model
  ti1 <- lcB[, 1]
  ti2 <- lcB[, 1]^2
  ti3 <- lcB[, 1]^3
  ss <- lm(lcB[, 2] - mean(lcA[, 2]) ~ ti1 + ti2 + ti3)

  initial <- c(mean(lcA[, 2]), log(0.01), log(200), ss$coefficients)
  delta.uniform.range <- c(0, 100)
  grid <- seq(0, 100, by = 0.1) 
  # grid interval "by = 0.1" is recommended,
  # but users can set a finer grid of values of the time delay.

  ###  Running the following codes takes more time than CRAN policy
  ###  Please type the following lines without "#" to run the function and to see the results

  #  logprof <- entirelogprofilelikelihood(data.lcA = lcA, data.lcB = lcB, grid = grid, 
  #                                        initial = initial, data.flux = FALSE, 
  #                                        delta.uniform.range = delta.uniform.range, micro = 3)

  #  plot(grid, logprof, type = "l", 
  #       xlab = expression(bold(Delta)),       
  #       ylab = expression(bold(paste("log L"[prof], "(", Delta, ")"))))
  #  prof <- exp(logprof - max(logprof))  # normalization
  #  plot(grid, prof, type = "l", 
  #       xlab = expression(bold(Delta)),       
  #       ylab = expression(bold(paste("L"[prof], "(", Delta, ")"))))






