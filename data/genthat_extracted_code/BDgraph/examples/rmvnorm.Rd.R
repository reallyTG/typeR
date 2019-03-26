library(BDgraph)


### Name: rmvnorm
### Title: Generate data from the multivariate Normal distribution
### Aliases: rmvnorm

### ** Examples

mean  <- c( 5, 20 )       
sigma <- matrix( c( 4, 2,
                    2, 5 ), 2, 2 )  # covariance matrix

sample <- rmvnorm( n = 500, mean = mean, sigma = sigma )
plot( sample )



