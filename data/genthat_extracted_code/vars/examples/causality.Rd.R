library(vars)


### Name: causality
### Title: Causality Analysis
### Aliases: causality
### Keywords: regression

### ** Examples

data(Canada)
var.2c <- VAR(Canada, p = 2, type = "const")
causality(var.2c, cause = "e")

#use a robust HC variance-covariance matrix for the Granger test:
causality(var.2c, cause = "e", vcov.=vcovHC(var.2c))

#use a wild-bootstrap procedure to for the Granger test
## Not run: causality(var.2c, cause = "e", boot=TRUE, boot.runs=1000)



