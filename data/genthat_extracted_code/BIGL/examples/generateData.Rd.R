library(BIGL)


### Name: generateData
### Title: Generate data from parameters of marginal monotherapy model
### Aliases: generateData

### ** Examples

  coefs <- c("h1" = 1, "h2" = 1.5, "b" = 0,
             "m1" = 1, "m2" = 2, "e1" = 0.5, "e2" = 0.1)

  ## Dose levels are set to be integers from 0 to 10
  generateData(coefs, sigma = 1)

  ## Dose levels are taken from existing dataset with d1 and d2 columns
  data <- subset(directAntivirals, experiment == 1)
  generateData(data = data[, c("d1", "d2")], pars = coefs, sigma = 1)



