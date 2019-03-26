library(rportfolios)


### Name: random.active
### Title: Random actively managed portfolio
### Aliases: random.active
### Keywords: math

### ** Examples

###
### the benchmark portfolios consists of 30 equally weighted investments
###
x.b <- rep( 1, 30 ) / 30
###
### the gross notional exposure of the long short portfolio is a benchmark weight
###
x.g <- 1 / 30
###
### generate 100 active portfolios with 30 non zero positions in the long short portolios
###
x <- random.active( x.b, x.g )
###
### generate 100 active portfolios with 10 non zero positions in the long short portolios
###
y <- random.active( x.b, x.g, 10 )



