library(laeken)


### Name: calibVars
### Title: Construct a matrix of binary variables for calibration
### Aliases: calibVars
### Keywords: survey

### ** Examples

data(eusilc)
# default method
aux <- calibVars(eusilc$rb090)
head(aux)
# data.frame method
aux <- calibVars(eusilc[, c("db040", "rb090")])
head(aux)



