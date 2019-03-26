library(roahd)


### Name: exp_cov_function
### Title: Exponential covariance function over a grid
### Aliases: exp_cov_function

### ** Examples


grid = seq( 0, 1, length.out = 5e2 )

alpha = 0.2
beta = 0.3

dev.new()
image( exp_cov_function( grid, alpha, beta ),
       main = 'Exponential covariance function',
       xlab = 'grid', ylab = 'grid')





