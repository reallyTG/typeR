library(SimCop)


### Name: GenerateRV.CopApprox
### Title: Generates random variates from a copula approximation
### Aliases: GenerateRV.CopApprox
### Keywords: distribution

### ** Examples

cop <- NewBEVAsyMixedModelCopula(theta=1, phi=-0.25)
approx1 <- GetApprox(cop)
approx2 <- GetApprox(cop, type = 1)
sample1 <- GenerateRV(approx1, 100)
plot(sample1)
sample2 <- GenerateRV(approx2, 100)
plot(sample2)
sample1 <- GenerateRV(approx1, 50, MH = TRUE, trace = TRUE)
plot(sample1)
sample2 <- GenerateRV(approx2, 50, MH = TRUE)
plot(sample2)




