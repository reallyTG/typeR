library(rrcov3way)


### Name: congruence
### Title: Coefficient of factor congruence (phi)
### Aliases: congruence congruence
### Keywords: multivariate models

### ** Examples

X <- getLoadings(PcaClassic(delivery))
Y <- getLoadings(PcaHubert(delivery, k=3))
round(congruence(X,Y),3)



