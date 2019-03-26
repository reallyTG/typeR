library(Bessel)


### Name: besselIasym
### Title: Asymptotic Expansion of besselI(x,nu) For Large x
### Aliases: besselIasym besselI.ftrms
### Keywords: math

### ** Examples

x <- c(1:10, 20, 50, 100^(2:10))
nu <- c(1, 10, 20, 50, 100)
r <- lapply(c(0:4,10,20), function(k.)
            sapply(nu, function(n.)
                  besselIasym(x, nu=n., k.max = k., log = TRUE)))
warnings() 



