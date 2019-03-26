library(uGMAR)


### Name: get_ar_roots
### Title: Calculate absolute values of the roots of the AR characteristic
###   polynomials
### Aliases: get_ar_roots

### ** Examples

params13 <- c(1.4, 0.88, 0.26, 2.46, 0.82, 0.74, 5.0, 0.68, 5.2, 0.72, 0.2)
gmar13 <- GSMAR(data=VIX, p=1, M=3, params=params13, model="GMAR")
get_ar_roots(gmar13)



