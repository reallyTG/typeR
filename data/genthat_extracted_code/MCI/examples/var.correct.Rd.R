library(MCI)


### Name: var.correct
### Title: Correcting MCI input variables
### Aliases: var.correct

### ** Examples

var1 <- c(11, 17.5, 24.1, 0.9, 21.2, 0)
# a vector containing one zero value
var.correct(var1)
# returns a vector with input values increased by 1

var2 <- -5:5
# a vector containing zero and negative values
var.correct(var2, corr.mode = "incabs", incby = 1)
# returns a vector with minimum value equal to 1

var.correct(var2, corr.mode = "zetas")
# returns a vector only with positive values 
# (zeta-squared transformation)



