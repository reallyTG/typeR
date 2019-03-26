library(SimCop)


### Name: GetApprox
### Title: Approximate a copula by a histogram density
### Aliases: GetApprox

### ** Examples

Cop <- NewMEVGumbelCopula(3)
CopApprox <- GetApprox(Cop, dim=2)
plot(CopApprox)




