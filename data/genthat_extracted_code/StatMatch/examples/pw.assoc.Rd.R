library(StatMatch)


### Name: pw.assoc
### Title: Pairwise association measure between categorical variables
### Aliases: pw.assoc
### Keywords: multivariate

### ** Examples

data(quine, package="MASS") #loads quine from MASS
str(quine)

# how Lrn is response variable
pw.assoc(Lrn~Age+Sex+Eth, data=quine)

# usage of units' weights
quine$ww <- runif(nrow(quine), 1,4) #random gen  1<=weights<=4
pw.assoc(Lrn~Age+Sex+Eth, data=quine, weights="ww")




