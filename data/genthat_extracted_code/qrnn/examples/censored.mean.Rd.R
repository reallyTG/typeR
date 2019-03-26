library(qrnn)


### Name: censored.mean
### Title: A hybrid mean/median function for left censored variables
### Aliases: censored.mean

### ** Examples

x <- c(0, 0, 1, 2, 3)
print(censored.mean(x, lower=0))
x.cens <- c(0, 0, 0, 1, 2)
print(censored.mean(x.cens, lower=0))



