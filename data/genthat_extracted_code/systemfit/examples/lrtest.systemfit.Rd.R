library(systemfit)


### Name: lrtest.systemfit
### Title: Likelihood Ratio test for Equation Systems
### Aliases: lrtest.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## unconstrained SUR estimation
fitsur <- systemfit( system, "SUR", data = Kmenta )

# create restriction matrix to impose \eqn{beta_2 = \beta_6}
R1 <- matrix( 0, nrow = 1, ncol = 7 )
R1[ 1, 2 ] <- 1
R1[ 1, 6 ] <- -1

## constrained SUR estimation
fitsur1 <- systemfit( system, "SUR", data = Kmenta, restrict.matrix = R1 )

## perform LR-test
lrTest1 <- lrtest( fitsur1, fitsur )
print( lrTest1 )   # rejected

# create restriction matrix to impose \eqn{beta_2 = - \beta_6}
R2 <- matrix( 0, nrow = 1, ncol = 7 )
R2[ 1, 2 ] <- 1
R2[ 1, 6 ] <- 1

## constrained SUR estimation
fitsur2 <- systemfit( system, "SUR", data = Kmenta, restrict.matrix = R2 )

## perform LR-test
lrTest2 <- lrtest( fitsur2, fitsur )
print( lrTest2 )   # accepted



