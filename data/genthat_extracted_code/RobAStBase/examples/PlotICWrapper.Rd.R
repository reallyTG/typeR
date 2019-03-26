library(RobAStBase)


### Name: PlotIC
### Title: Wrapper function for plot method for IC
### Aliases: PlotIC

### ** Examples

# Gamma
fam <- GammaFamily()
rfam <- InfRobModel(fam, ContNeighborhood(0.5))
IC <- optIC(model = fam, risk = asCov())
Y <- distribution(fam)
y <- r(Y)(1000)
PlotIC(IC, y, withCall = FALSE)



