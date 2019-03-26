library(Bessel)


### Name: besselI.nuAsym
### Title: Asymptotic Expansion of Bessel I(x,nu) and K(x,nu) for Large nu
###   (and x)
### Aliases: besselI.nuAsym besselK.nuAsym
### Keywords: math

### ** Examples

x <- c(1:10, 20, 50, 100, 100000)
nu <- c(1, 10, 20, 50, 10^(2:10))

sapply(0:4, function(k.)
            sapply(nu, function(n.)
                   besselI.nuAsym(x, nu=n., k.max = k., log = TRUE)))

sapply(0:4, function(k.)
            sapply(nu, function(n.)
                   besselK.nuAsym(x, nu=n., k.max = k., log = TRUE)))



