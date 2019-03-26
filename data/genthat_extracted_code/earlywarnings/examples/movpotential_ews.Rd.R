library(earlywarnings)


### Name: movpotential_ews
### Title: Moving Average Potential
### Aliases: movpotential_ews
### Keywords: early-warning

### ** Examples

X = c(rnorm(1000, mean = 0), rnorm(1000, mean = -2), rnorm(1000, mean = 2)); 
param = seq(0,5,length=3000); 
res <- movpotential_ews(X, param)



