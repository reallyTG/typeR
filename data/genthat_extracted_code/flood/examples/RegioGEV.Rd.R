library(flood)


### Name: RegioGEV
### Title: Regional (or local) parameter and quantile estimation
### Aliases: RegioGEV

### ** Examples

library("evd")
# sample observations of 75 years at one station:
x <- rgev(75) # x is a vector
RegioGEV(x=x, p=0.95)

x2 <- c(NA, NA, x[1:60], NA, x[61:75]) # vector of observations with missing values
RegioGEV(x=x2, p=0.95) # NAs will be removed

# sample observations of 100 years at 4 stations:
set.seed(1053)
x <- matrix(rgev(400, 2, 1, 0.3), ncol=4)
RegioGEV(x=x, p=0.9, j=3, leftrim=0, rightrim=0) # optimal weighting
RegioGEV(x=x, p=0.9, j=3, leftrim=0, rightrim=1) # optimal weighting

# With missing values:
x2 <- x
x2[c(54, 89, 300)] <- NA
RegioGEV(x=x2, p=0.9, j=3, leftrim=0, rightrim=0)

# sample again observations of 100 years at 4 stations:
set.seed(958)
x <- matrix(rgev(400, 2, 1, 0.3), ncol=4)
RegioGEV(x=x, p=0.9, j=3, leftrim=0, rightrim=0) # simple weighting



