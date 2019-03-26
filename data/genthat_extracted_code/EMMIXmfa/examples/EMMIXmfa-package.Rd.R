library(EMMIXmfa)


### Name: EMMIXmfa-package
### Title: Mixture Models with Component-Wise Factor Analyzers
### Aliases: EMMIXmfa-package emmixmfa-package EMMIXmfa emmixmfa
### Keywords: package clustering multivariate model

### ** Examples

## No test: 
set.seed(1)
Y <- iris[, -5]
mfa_model <- mfa(Y, g = 3, q = 3)
mtfa_model <- mtfa(Y, g = 3, q = 3)
mcfa_model <- mcfa(Y, g = 3, q = 3)
mctfa_model <- mctfa(Y, g = 3, q = 3)
## End(No test)



