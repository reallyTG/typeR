library(qgam)


### Name: log1pexp
### Title: Calculating log(1+exp(x)) accurately
### Aliases: log1pexp

### ** Examples

set.seed(141)
library(qgam); 
x <- rnorm(100, 0, 100)
log1pexp(x) - log1p(exp(x))



