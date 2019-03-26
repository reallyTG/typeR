library(lgarch)


### Name: glag
### Title: Lag a vector or a matrix, with special treatment of zoo objects
### Aliases: glag
### Keywords: Statistical Models Time Series Financial Econometrics

### ** Examples

##lag series with NA for the missing entries:
x <- rnorm(5)
glag(x)

##lag series with no padding:
x <- rnorm(5)
glag(x, pad=FALSE)

##lag series and retain the original zoo-index ordering:
x <- as.zoo(rnorm(5))
glag(x)

##lag two periods:
glag(x, k=2)




