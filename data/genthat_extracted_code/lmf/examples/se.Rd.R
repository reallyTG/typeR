library(lmf)


### Name: se
### Title: Standard error
### Aliases: se

### ** Examples

#The standard error of samples with the same mean and standard deviation, but
  #of different sizes.
se(rnorm(n = 10, mean = 5, sd = 1))
se(rnorm(n = 100, mean = 5, sd = 1))
se(rnorm(n = 1000, mean = 5, sd = 1))
se(rnorm(n = 10000, mean = 5, sd = 1))



