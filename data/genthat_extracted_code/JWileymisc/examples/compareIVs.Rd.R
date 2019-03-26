library(JWileymisc)


### Name: compareIVs
### Title: Compares the effects of various independent variables on
###   dependent variables
### Aliases: compareIVs

### ** Examples

test1 <- compareIVs(
  dv = c("mpg", "disp"),
  type = c("normal", "normal"),
  iv = c("hp", "qsec"),
  covariates = "am",
  data = mtcars, multivariate = TRUE)
test1$OverallSummary
rm(test1)



