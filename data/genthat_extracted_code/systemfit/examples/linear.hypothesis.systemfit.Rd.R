library(systemfit)


### Name: linearHypothesis.systemfit
### Title: Test Linear Hypothesis
### Aliases: linearHypothesis.systemfit
### Keywords: models

### ** Examples

data( "Kmenta" )
eqDemand <- consump ~ price + income
eqSupply <- consump ~ price + farmPrice + trend
system <- list( demand = eqDemand, supply = eqSupply )

## unconstrained SUR estimation
fitsur <- systemfit( system, method = "SUR", data=Kmenta )

# create hypothesis matrix to test whether beta_2 = \beta_6
R1 <- matrix( 0, nrow = 1, ncol = 7 )
R1[ 1, 2 ] <- 1
R1[ 1, 6 ] <- -1
# the same hypothesis in symbolic form
restrict1 <- "demand_price - supply_farmPrice = 0"

## perform Theil's F test
linearHypothesis( fitsur, R1 )  # rejected
linearHypothesis( fitsur, restrict1 )

## perform Wald test with F statistic
linearHypothesis( fitsur, R1, test = "F" )  # rejected
linearHypothesis( fitsur, restrict1 )

## perform Wald-test with chi^2 statistic
linearHypothesis( fitsur, R1, test = "Chisq" )  # rejected
linearHypothesis( fitsur, restrict1, test = "Chisq" )

# create hypothesis matrix to test whether beta_2 = - \beta_6
R2 <- matrix( 0, nrow = 1, ncol = 7 )
R2[ 1, 2 ] <- 1
R2[ 1, 6 ] <- 1
# the same hypothesis in symbolic form
restrict2 <- "demand_price + supply_farmPrice = 0"

## perform Theil's F test
linearHypothesis( fitsur, R2 )  # accepted
linearHypothesis( fitsur, restrict2 )

## perform Wald test with F statistic
linearHypothesis( fitsur, R2, test = "F" )  # accepted
linearHypothesis( fitsur, restrict2 )

## perform Wald-test with chi^2 statistic
linearHypothesis( fitsur, R2, test = "Chisq" )  # accepted
linearHypothesis( fitsur, restrict2, test = "Chisq" )



