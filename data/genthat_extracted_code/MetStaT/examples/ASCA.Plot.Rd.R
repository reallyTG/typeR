library(MetStaT)


### Name: ASCA.Plot
### Title: Plot ASCA results
### Aliases: ASCA.Plot
### Keywords: ASCA PCA

### ** Examples

##Plot the results after doing ASCA.Calculate
## use the data matrix, 'data', and an experimental design matrix, 'F'.
data(ASCAdata)
ASCA <- ASCA.Calculate(ASCAX, ASCAF, equation.elements = "1,2,12", scaling = TRUE)

## plot the results to a graphical output such as R's pdf writer
pdf("ASCA_Results.pdf")
ASCA.Plot(ASCA)
dev.off()



