library(timedelay)


### Name: timedelay
### Title: Time Delay Estimation for Stochastic Time Series of
###   Gravitationally Lensed Quasars
### Aliases: timedelay-package timedelay
### Keywords: package

### ** Examples


  # Loading datasets
  data(simple)
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
  output <- bayesian(data.lcA = lcA, data.lcB = lcB, 
                     data.flux = FALSE, theta.ini = c(0, 0.01, 200), 
                     delta.ini = 50, delta.uniform.range = c(0, 100), 
                     delta.proposal.scale = 1, 
                     tau.proposal.scale = 3, 
                     tau.prior.shape = 1, tau.prior.scale = 1,
                     sigma.prior.shape = 1, sigma.prior.scale = 2 / 10^7, 
                     asis = TRUE, micro = 3,
                     sample.size = 100, warmingup.size = 50)

  names(output)
  # hist(output$delta)
  # plot(output$delta, type = "l")
  # acf(output$delta)

  ### Argument description

  # data.lcA: An n1 by three matrix for image A (light curve A) with 
  #           n1 observation times in the first column,
  #           n1 observed magnitudes (or in flux) in the second column,
  #           n1 measurement errors for image A in the third column.

  # data.lcB: An n2 by three matrix for image B (light curve B) with 
  #           n2 observation times in the first column,
  #           n2 observed magnitudes (or in flux) in the second column,
  #           n2 measurement errors for image A in the third column.

  # data.flux: "True" if data are recorded on flux scale or "FALSE" if data are on magnitude scale.
  # If your observed time series can take on negative values, then data.flux = FALSE.

  # theta.ini: Initial values of theta = (mu, sigma, tau) for MCMC.
  # delta.ini: Initial values of the time delay for MCMC.
  # delta.uniform.range: The range of the Uniform prior distribution for the time delay.
  #                      The feasible entire support is 
  #                      c(min(simple[, 1]) - max(simple[, 1]), max(simple[, 1]) - min(simple[, 1]))

  # delta.proposal.scale: The proposal scale of the Metropolis step for the time delay.
  # tau.proposal.scale: The proposal scale of the Metropolis-Hastings step for tau.

  # tau.prior.shape: The shape parameter of the Inverse-Gamma hyper-prior distribution for tau. 
  # tau.prior.scale: The scale parameter of the Inverse-Gamma hyper-prior distribution for tau. 
  # sigma.prior.shape: The shape parameter of 
  #                    the Inverse-Gamma hyper-prior distribution for sigma^2.
  # sigma.prior.scale: The scale parameter of 
  #                    the Inverse-Gamma hyper-prior distribution for sigma^2.
  # micro: It determines the order of a polynomial regression model that accounts 
  #        for the difference between microlensing trends. Default is 3. 
  #        When zero is assigned, the Bayesian model fits a curve-shifted model.

  # asis: "TRUE" if we use the ancillarity-sufficiency interweaving strategy (ASIS) 
  #       for c (always recommended)
  # multimodality: "TRUE" if we use the repelling-attracting Metropolis algorithm
  #                for sampling Delta in the presence of multimodality.
  #                Please make sure that "adaptive.delta = FALSE" so that 
  #                adaptive MCMC for Delta is not used in the presence of multimodality.

  # adaptive.freqeuncy: The adaptive MCMC is applied for every specified frequency. 
  #                     If it is specified as 100, 
  #                     the adaptive MCMC is applied to every 100th iterstion.
  # adaptive.delta: "TRUE" if we use the adaptive MCMC for the time delay.
  # adaptive.delta.factor: The factor, exp(adaptive.delta.factor) or exp(-adaptive.delta.factor), 
  #                        multiplied to the proposal scale of the time delay for adaptive MCMC.
  #                        Default is 0.01.

  # adaptive.tau: "TRUE" if we use the adaptive MCMC for tau.
  # adaptive.tau.factor: The factor, exp(adaptive.tau.factor) or exp(-adaptive.tau.factor), 
  #                      multiplied to the proposal scale of tau for adaptive MCMC.

  # sample.size: The number of posterior samples for each parameter
  # warmingup.size: The number of burn-ins

  # Type ?bayesian for further details on graphical model checking.

  ################################################
  # Time delay estimation via profile likelihood #
  ################################################

  ###### The entire profile likelihood values on the grid of values of the time delay.


  # Cubic microlensing model
  ti1 <- lcB[, 1]
  ti2 <- lcB[, 1]^2
  ti3 <- lcB[, 1]^3
  ss <- lm(lcB[, 2] - mean(lcA[, 2]) ~ ti1 + ti2 + ti3)

  initial <- c(mean(lcA[, 2]), log(0.01), log(200), ss$coefficients)
  delta.uniform.range <- c(0, 100)
  grid <- seq(0, 100, by = 0.1) 
  # grid interval "by = 0.1" is recommended for accuracy,
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

  ### Argument description

  # data.lcA: The data set (n by 3 matrix) for light curve A 
  # (1st column: observation times, 2nd column: values of fluxes or magnitudes,
  #  3rd column: measurement errors)
  # data.lcB: The data set (w by 3 matrix) for light curve B 
  # (1st column: observation times, 2nd column: values of fluxes or magnitudes,
  #  3rd column: measurement errors)
  # grid: the vector of grid values of the time delay 
  #       on which the log profile likelihood values are calculated.
  # initial: The initial values of the other model parameters (mu, log(sigma), log(tau), beta)
  # data.flux: "True" if data are recorded on flux scale or "FALSE" if data are on magnitude scale.
  # delta.uniform.range: The range of the Uniform prior distribution for the time delay.
  # micro: It determines the order of a polynomial regression model that accounts 
  #        for the difference between microlensing trends. Default is 3. 
  #        When zero is assigned, the Bayesian model fits a curve-shifted model.




