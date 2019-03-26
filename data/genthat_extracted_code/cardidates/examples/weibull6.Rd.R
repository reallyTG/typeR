library(cardidates)


### Name: weibull6
### Title: Six-Parametric Weibull Function
### Aliases: weibull6 fweibull6 aweibull6
### Keywords: math arith

### ** Examples

x <- seq(0, 150)
plot(x, fweibull6(x, c(0.833, 40, 5, 0.2, 80, 5)), type = "l", ylim = c(0,2))

## interpretation of offsets
ofs1 <- 0.1
ofs2 <- 0.3
p1 <- 1-ofs1/(ofs2 + 1)

lines(x, fweibull6(x, c(p1, 20, 5, ofs2, 60, 5)), col = "red")

## definite integratel from zero to 150, returns scalar
aweibull6(c(p1, 20, 5, ofs2, 60, 5), lower = 0, upper = 150)

## use Vectorize to create vectorized functions
vec.aweibull6 <- Vectorize(aweibull6, "upper")
plot(x, vec.aweibull6(c(p1, 20, 5, ofs2, 60, 5), lower = 0, upper = x))



