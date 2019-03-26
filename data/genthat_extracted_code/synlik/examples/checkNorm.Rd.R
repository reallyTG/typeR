library(synlik)


### Name: checkNorm
### Title: Checking the multivariate normal approximation.
### Aliases: checkNorm

### ** Examples

#### Create Object
data(ricker_sl)

#### Simulate from the object
ricker_sl@data <- simulate(ricker_sl)
ricker_sl@extraArgs$obsData <- ricker_sl@data 

#### Checking multivariate normality
checkNorm(ricker_sl)

# With matrix input
checkNorm(matrix(rnorm(200), 100, 2))



