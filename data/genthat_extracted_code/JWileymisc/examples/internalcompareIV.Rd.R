library(JWileymisc)


### Name: internalcompareIV
### Title: Compares the effects of various independent variables
### Aliases: internalcompareIV
### Keywords: internal

### ** Examples

test1 <- JWileymisc:::internalcompareIV(
  dv = "mpg", type = "normal",
  iv = "hp",
  covariates = "am",
  data = mtcars, multivariate = FALSE)
test1$Summary
rm(test1)



