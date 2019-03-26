library(discfrail)


### Name: sim_weibdf
### Title: Simulation of grouped time-to-event data with Weibull baseline
###   hazard and discrete shared frailty distribution
### Aliases: sim_weibdf

### ** Examples

J <- 100
N <- 40
lambda <- 0.5
beta <- 1.6
rho <- 1
p <- c( 0.8, 0.2 )
w_values <- c( 0.8, 1.6 )
cens_perc <- 0.2
data <- sim_weibdf( J, N, lambda, rho, beta, p, w_values, cens_perc)
head( data )




