library(cmna)


### Name: romberg
### Title: Romberg Integration
### Aliases: romberg

### ** Examples

f <- function(x) { sin(x)^2 + log(x)}
romberg(f, 1, 10, m = 3)
romberg(f, 1, 10, m = 5)
romberg(f, 1, 10, m = 10)




