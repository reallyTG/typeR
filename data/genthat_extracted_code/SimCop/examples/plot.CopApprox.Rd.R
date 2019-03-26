library(SimCop)


### Name: plot.CopApprox
### Title: Plot the histogram density approximation to a copula
### Aliases: plot.CopApprox
### Keywords: hplot

### ** Examples

Cop <- NewMEVGumbelCopula(4)
CopApprox1 <- GetApprox(Cop, dim=2)
plot(CopApprox1)
CopApprox2 <- GetApprox(Cop, dim=2, type=2)
plot(CopApprox2)




