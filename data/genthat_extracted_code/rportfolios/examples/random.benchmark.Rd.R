library(rportfolios)


### Name: random.benchmark
### Title: Random Naive Benchmark Portfolios
### Aliases: random.benchmark
### Keywords: math

### ** Examples

###
### long only portfolio of 30 investments with 30 non-zero positions
### the margins of the truncated random variables are uniform
###
p.1 <- random.benchmark( 30 )
###
### long only portfolio of 30 investments with 10 non-zero positions
### the margins of the truncated random variables are uniform
###
p.2 <- random.benchmark( 30, 10 )
###
### long only portfolio of 30 investments with 30 non-zero positions
### the margins of the truncated random variables are log normal
### with zero log mean and unit log standard deviation
###
p.3 <- random.benchmark( 30, margins="lnorm", meanlog=0, sdlog=1 )
###
### long only portfolio of 30 investments with 10 non-zero positions
### the margins of the truncated random variables are log normal
### with zero log mean and unit log standard deviation
###
p.4 <- random.benchmark( 30, 10, margins="lnorm", meanlog=0, sdlog=1 )



