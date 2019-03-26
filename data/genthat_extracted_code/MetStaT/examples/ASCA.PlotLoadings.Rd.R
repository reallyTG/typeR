library(MetStaT)


### Name: ASCA.PlotLoadings
### Title: Loadings plot for a specific factor/interaction of the ASCA
### Aliases: ASCA.PlotLoadings

### ** Examples

##Plot selected loadings after doing PerformAsca
## use the data matrix, ASCAX, and an experimental design matrix, ASCAF.
data(ASCAdata)
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = TRUE)

## plot the loadings of the first two principal components of the first factor
ASCA.PlotLoadings(ASCA, ee = "1", pcs="1,2")



