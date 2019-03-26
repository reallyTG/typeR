library(rportfolios)


### Name: random.active.test
### Title: Random actively managed portfolio
### Aliases: random.active.test
### Keywords: math

### ** Examples

###
### benchmark consists of 20 equally weighted investments
###
x.b <- rep( 1, 30 ) / 30
###
### gross notion exposure is one of the investment weights
###
x.g <- 1 / 30
###
### generate 100 active portfolios with 30 non zero positions in the long short portfolio
###
x.result <- random.active.test( x.b, x.g )
###
### generate 100 active portfolios with 10 non zero positions in the long short portfolio
###
y.result <- random.active.test( x.b, x.g, 10 )



