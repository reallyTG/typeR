library(rportfolios)


### Name: rbenchmark.test
### Title: Generate random naive benchmark portfolios
### Aliases: rbenchmark.test
### Keywords: math

### ** Examples

###
### 100 long only portfolios of 30 investments with 30 non-zero positions
### the margins of the truncated random variables are uniform
###
p.1.result <- rbenchmark.test( 100, 30 )
###
### 100 long only portfolios of 30 investments with 10 non-zero positions
### the margins of the truncated random variables are uniform
###
p.2.result <- rbenchmark.test( 100, 30, 10 )
###
### 100 long only portfolios of 30 investments with 30 non-zero positions
### the margins of the truncated random variables are log normal
### with zero log mean and unit log standard deviation
###
p.3.result <- rbenchmark.test( 100, 30, margins="lnorm", meanlog=0, sdlog=1 )
###
### 100 long only portfolios of 30 investments with 10 non-zero positions
### the margins of the truncated random variables are log norm
### with zero log mean and unit log standard deviation
###
p.4.result <- rbenchmark.test( 100, 30, 10, margins="lnorm", meanlog=0, sdlog=1 )



