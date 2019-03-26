library(Dowd)


### Name: GParetoES
### Title: Expected Shortfall for Generalized Pareto
### Aliases: GParetoES

### ** Examples

# Computes ES assuming generalised Pareto for following parameters
   Ra <- 5 * rnorm(100)
   beta <- 1.2
   zeta <- 1.6
   threshold.prob <- .85
   cl <- .99
   GParetoES(Ra, beta, zeta, threshold.prob, cl)



