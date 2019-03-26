library(MetStaT)


### Name: ASCA.PlotScoresPerLevel
### Title: ASCA scores plot with projected data.
### Aliases: ASCA.PlotScoresPerLevel
### Keywords: ASCA PCA

### ** Examples

##Plot the results after doing PerformAsca
## use the data matrix, ASCAX, and an experimental design matrix, ASCAF.
data(ASCAdata)
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = TRUE)

## plot the scores for the first two principal components and the projections of 
## the data for the second factor
ASCA.PlotScoresPerLevel(ASCA, ee = "2", pcs = "1,2")



