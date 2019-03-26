library(actuar)


### Name: simul
### Title: Simulation from Compound Hierarchical Models
### Aliases: simul simpf rcomphierarc print.portfolio
### Keywords: datagen

### ** Examples

## Two level (contracts and years) portfolio with frequency model
## Nit|Theta_i ~ Poisson(Theta_i), Theta_i ~ Gamma(2, 3) and severity
## model X ~ Lognormal(5, 1)
simul(nodes = list(contract = 10, year = 5),
      model.freq = expression(contract = rgamma(2, 3),
                              year = rpois(contract)),
      model.sev = expression(contract = NULL,
                             year = rlnorm(5, 1)))

## Model with weights and mixtures for both frequency and severity
## models
nodes <- list(entity = 8, year = c(5, 4, 4, 5, 3, 5, 4, 5))
mf <- expression(entity = rgamma(2, 3),
                 year = rpois(weights * entity))
ms <- expression(entity = rnorm(5, 1),
                 year = rlnorm(entity, 1))
wit <- sample(2:10, 35, replace = TRUE)
pf <- simul(nodes, mf, ms, wit)
pf 				# print method
weights(pf)			# extraction of weights
aggregate(pf)[, -1]/weights(pf)[, -1] # ratios

## Four level hierarchical model for frequency only
nodes <- list(sector = 3, unit = c(3, 4),
              employer = c(3, 4, 3, 4, 2, 3, 4), year = 5)
mf <- expression(sector = rexp(1),
                 unit = rexp(sector),
                 employer = rgamma(unit, 1),
                 year = rpois(employer))
pf <- simul(nodes, mf, NULL)
pf 				# print method
aggregate(pf) 			# aggregate claim amounts
frequency(pf)  			# frequencies
severity(pf)			# individual claim amounts

## Standard, non hierarchical, compound model with simplified
## syntax (function rcompound() is much faster for such cases)
simul(10,
      model.freq = expression(rpois(2)),
      model.sev = expression(rgamma(2, 3)))



