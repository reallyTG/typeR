library(cmna)


### Name: adaptint
### Title: Adaptive Integration
### Aliases: adaptint

### ** Examples

f <- function(x) { sin(x)^2 + log(x) }
adaptint(f, 1, 10, n = 4)
adaptint(f, 1, 10, n = 5)
adaptint(f, 1, 10, n = 10)




