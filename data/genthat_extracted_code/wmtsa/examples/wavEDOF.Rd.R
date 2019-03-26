library(wmtsa)


### Name: wavEDOF
### Title: Equivalent degrees of freedom (EDOF) estimates for a chi-squared
###   distribution
### Aliases: wavEDOF
### Keywords: distribution

### ** Examples

## initialize variables 
n.level <- 9
wavelet <- "d6"
N       <- 4096
phi     <- 0.9

## define input SDF 
S <- function(f, phi)  1/(1 + phi^2 - 2*phi*cos(2*pi*f))
sdfarg <- list(phi=phi)

## create series and MODWT 
set.seed(100)
x <- rnorm(N)
W <- wavMODWT(x, wavelet=wavelet, n.level=n.level)

## calculate EDOF using the wavTransform object 
z1 <- wavEDOF(W, sdf=S, sdfarg=sdfarg)
print(z1)

## calculate EDOF using original time series 
z2 <- wavEDOF(x, wavelet=wavelet, levels=seq(n.level), sdf=S, sdfarg=sdfarg)
print(z2)

## compare the two approaches 
print(all.equal(z1,z2))



