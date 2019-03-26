library(Bessel)


### Name: BesselH
### Title: Hankel (H-Bessel) Function (of Complex Argument)
### Aliases: Hankel BesselH
### Keywords: math

### ** Examples

##------------------ H(1, *) ----------------
nus <- c(1,2,5,10)
for(i in seq_along(nus))
   curve(BesselH(1, x, nu=nus[i]), -10, 10, add= i > 1, col=i, n=1000)
legend("topleft", paste("nu = ", format(nus)), col = seq_along(nus), lty=1)

## nu = 10 looks a bit  "special" ...   hmm...
curve(BesselH(1, x, nu=10), -.3, .3, col=4,
      ylim = c(-10,10), n=1000)

##------------------ H(2, *) ----------------
for(i in seq_along(nus))
   curve(BesselH(2, x, nu=nus[i]), -10, 10, add= i > 1, col=i, n=1000)
legend("bottomright", paste("nu = ", format(nus)), col = seq_along(nus), lty=1)
## the same nu = 10 behavior ..



