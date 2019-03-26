library(pracma)


### Name: shubert
### Title: Shubert-Piyavskii Method
### Aliases: shubert
### Keywords: optimize

### ** Examples

# Determine the global minimum of sin(1.2*x)+sin(3.5*x) in [-3, 8].
f <- function(x) sin(1.2*x) + sin(3.5*x)
shubert(function(x) -f(x), -3, 8, 5, 1e-04, 1000)
## $xopt
## [1] 3.216231     # 3.216209
## $fopt
## [1] 1.623964
## $nopt
## [1] 481



