library(flood)


### Name: RegioWeissman
### Title: Quantile estimation: Weissman's extrapolation
### Aliases: RegioWeissman

### ** Examples

library("evd")
# sample observations of 75 years at one station:
x <- rgev(75, 0, 1, 0) # x is a vector
RegioWeissman(x=x, p=0.95)

x2 <- c(NA, NA, x[1:60], NA, x[61:75]) # vector of observations with missing values
RegioWeissman(x=x2, p=0.95) # NAs will be removed

# sample observations of 100 years at 4 stations:
set.seed(1053)
x <- matrix(rgev(400, 2, 1, 0.3), ncol=4)
RegioWeissman(x=x, p=0.9, j=3)

# With missing values:
x2 <- x
x2[sample(100, 12),2] <- NA
RegioWeissman(x=x2, p=0.9, j=3)



