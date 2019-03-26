library(jvnVaR)


### Name: jMCPriLim
### Title: Monte-Carlo Price Simulation (under price limit condition)
### Aliases: jMCPriLim
### Keywords: jVaR jPrice jReturn

### ** Examples

s0 <- 100
mu <- 0.02
sigma <- 0.1
m <- 1000
L <- -0.07
U <- 0.07
jMCPriLim (s0, L, U, mu, sigma, m) 



