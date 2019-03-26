library(Dowd)


### Name: BootstrapVaR
### Title: Bootstrapped VaR for specified confidence level
### Aliases: BootstrapVaR

### ** Examples

# Estimates bootstrapped VaR for given parameters
   a <- rnorm(100) # generate a random profit/loss vector
   BootstrapES(a, 50, 0.95)



