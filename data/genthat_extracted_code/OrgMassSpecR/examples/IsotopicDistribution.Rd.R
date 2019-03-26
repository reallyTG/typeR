library(OrgMassSpecR)


### Name: IsotopicDistribution
### Title: Isotopic Distribution of an Organic Molecule.
### Aliases: IsotopicDistribution

### ** Examples

x <- IsotopicDistribution(formula = list(C = 9, H = 4, Br = 5, Cl = 1, N = 2))
library(lattice)
xyplot(percent ~ mz, data = x,
  type = "h",
  xlab = "m/z",
  ylab = "intensity (%)",
  main = "Isotopic Distribution, C9H4Br5ClN2")



