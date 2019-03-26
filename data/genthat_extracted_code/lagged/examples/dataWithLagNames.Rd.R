library(lagged)


### Name: dataWithLagNames
### Title: Lagged data with named lag dimension
### Aliases: dataWithLagNames

### ** Examples

x <- Lagged(drop(acf(ldeaths, plot = FALSE)$acf))
## there are no names for the lags:
names(x) # NULL
## but the print method inserts default "Lag_N" names
x
## This sets the names to their defaults:
x1 <- dataWithLagNames(x)
names(x1)
## ... and this sets non-default prefix:
x2 <- dataWithLagNames(x, "L")
names(x2)
x2



