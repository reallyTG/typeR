library(RobAStBase)


### Name: InfoPlot
### Title: Wrapper function for information plot method
### Aliases: InfoPlot

### ** Examples

# Gamma
fam  <-  GammaFamily()
IC <- optIC(model = fam, risk = asCov())
Y <- distribution(fam)
data  <-  r(Y)(500)
InfoPlot(IC, data, withCall = FALSE)



