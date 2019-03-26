library(MetStaT)


### Name: ASCA.Calculate

### Title: ASCA method (ANOVA-simultaneous component analysis)
### Aliases: ASCA.Calculate
### Keywords: ASCA PCA

### ** Examples

## use the data matrix, 'ASCAX', and an experimental design matrix, 'ASCAF'
data(ASCAdata)
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = FALSE)

## plot the results
ASCA.Plot(ASCA)



