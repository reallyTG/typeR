library(rportfolios)


### Name: ractive.test
### Title: Generate random active portfolios
### Aliases: ractive.test
### Keywords: math

### ** Examples

###
### benchmark consists of 20 equally weighted investments
###
x.b <- rep( 1, 30 ) / 30
###
### the gross notional exposure of the long short portfolio is a benchmark weight
###
x.g <- 1 / 30
###
### generate 100 random active portfolios with 30 non zero positions in the long short portfolios
###
x.matrix <- ractive.test( 100, x.b, x.g )
###
### generate 100 random active portfolios with 10 non zero positions in the long short portfolios
###
y.matrix <- ractive.test( 100, x.b, x.g, 10 )



