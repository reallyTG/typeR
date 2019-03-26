library(GA)


### Name: summary.ga-method
### Title: Summary for Genetic Algorithms
### Aliases: summary,ga-method summary.ga print.summary.ga
### Keywords: optimize

### ** Examples

f <- function(x)  abs(x)+cos(x)
GA <- ga(type = "real-valued", 
         fitness = function(x) -f(x), 
         lower = -20, upper = 20, run = 50)
out <- summary(GA)
print(out)
str(out)



