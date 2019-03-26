library(pracma)


### Name: golden_ratio
### Title: Golden Ratio Search
### Aliases: golden_ratio
### Keywords: optimize

### ** Examples

f <- function(x) x * cos(0.1*exp(x)) * sin(0.1*pi*exp(x))
golden_ratio(f, 0, 4, tol=10^-10)  # $xmin    = 3.24848329206212
optimize(f, c(0,4), tol=10^-10)    # $minimum = 3.24848328971188



