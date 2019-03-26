library(cents)


### Name: CM
### Title: Censored mean and standard deviation in normal samples
### Aliases: CM
### Keywords: models htest

### ** Examples

z <- log(NiagaraToxic$toxic)
iz <- c("o", "L")[1+NiagaraToxic$cQ]
CM(z,iz)
cenarma(z, iz, p=0, q=0)



