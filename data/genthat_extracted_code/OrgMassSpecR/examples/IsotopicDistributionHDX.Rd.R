library(OrgMassSpecR)


### Name: IsotopicDistributionHDX
### Title: Isotopic Distribution of a Peptide Undergoing H-D Exchange
### Aliases: IsotopicDistributionHDX

### ** Examples

## simulate a peptide with 0.0115 and 100 percent incorporation and plot
x <- IsotopicDistributionHDX("NECFLQHK", incorp = 0.000115)
x$t <- "incorp = 0.0115%"
y <- IsotopicDistributionHDX("NECFLQHK", incorp = 1)
y$t <- "incorp = 100%"
z <- rbind(x, y)
library(lattice)
print(xyplot(percent ~ mz | t, data = z,
       type = "h", main = "H-D exchange simulation",
       xlab = "m/z", ylab = "intensity (%)"))



