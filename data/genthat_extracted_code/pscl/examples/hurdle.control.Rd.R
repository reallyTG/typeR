library(pscl)


### Name: hurdle.control
### Title: Control Parameters for Hurdle Count Data Regression
### Aliases: hurdle.control
### Keywords: regression

### ** Examples

data("bioChemists", package = "pscl")

## default start values
fm1 <- hurdle(art ~ fem + ment, data = bioChemists,
              dist = "negbin", zero = "negbin")

## user-supplied start values and other options
fm2 <- hurdle(art ~ fem + ment, data = bioChemists,
              dist = "negbin",
              zero = "negbin",
              trace=TRUE,
              separate=FALSE,
              start = list(count = c(0.3, -0.2, 0),
                           zero = c(4, -2, 0.8),
                           theta = c(count = 2, zero = 0.1)))




