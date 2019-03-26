library(RandomFieldsUtils)


### Name: Struve
### Title: Modified Struve functions and related functions
### Aliases: struve Struve struveH struveL bessel I0L0 I0ML0
### Keywords: math

### ** Examples


if (FALSE) {

x <- seq(1, 2, 0.1)
struveH(x, 0)
struveH(x, 1)

I0L0(x) - (besselI(x, nu=0) - struveL(x, 0)) 
besselI(x, nu=1) - struveL(x, 1) ## cf. Abramovitz & Stegun, table 12.1

}




