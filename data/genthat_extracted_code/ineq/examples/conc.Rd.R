library(ineq)


### Name: conc
### Title: Concentration Measures
### Aliases: conc Herfindahl Rosenbluth
### Keywords: univar

### ** Examples

# generate vector (of sales)
x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
# compute Herfindahl coefficient with parameter 1
conc(x)
# compute coefficient of Hall/Tiedemann/Rosenbluth
conc(x, type="Rosenbluth")



