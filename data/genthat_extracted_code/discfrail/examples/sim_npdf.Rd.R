library(discfrail)


### Name: sim_npdf
### Title: Simulation of grouped time-to-event data with nonparametric
###   baseline hazard and discrete shared frailty distribution
### Aliases: sim_npdf

### ** Examples

J <- 100
N <- 40
Lambda_0_inv = function( t, c=0.01, d=4.6 ) ( t^( 1/d ) )/c
beta <- 1.6
p <- c( 0.8, 0.2 )
w_values <- c( 0.8, 1.6 )
cens_perc <- 0.1
data <- sim_npdf( J, N, beta, Lambda_0_inv, p, w_values, cens_perc )
head( data )



