library(simPop)


### Name: calibVars
### Title: Construct a matrix of binary variables for calibration
### Aliases: calibVars
### Keywords: survey

### ** Examples

data(eusilcS)
# default method
aux <- calibVars(eusilcS$rb090)
head(aux)
# data.frame method
aux <- calibVars(eusilcS[, c("db040", "rb090")])
head(aux)



