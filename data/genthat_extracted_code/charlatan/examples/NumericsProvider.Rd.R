library(charlatan)


### Name: NumericsProvider
### Title: NumericsProvider
### Aliases: NumericsProvider
### Keywords: internal

### ** Examples

z <- NumericsProvider$new()

z$double()
z$double(10)
z$double(10, mean = 100)
z$double(10, mean = 100, sd = 17)

z$integer()
z$integer(10)
z$integer(10, 1, 20)
z$integer(10, 1, 10000000L)

z$unif()
z$norm()
z$lnorm(10)
z$beta(10, 1, 1)



