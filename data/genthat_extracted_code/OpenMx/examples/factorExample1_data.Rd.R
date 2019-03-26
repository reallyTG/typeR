library(OpenMx)


### Name: factorExample1
### Title: Example Factor Analysis Data
### Aliases: factorExample1
### Keywords: datasets

### ** Examples

data(factorExample1)
round(cor(factorExample1), 2)

factanal(covmat=cov(factorExample1), factors=3, rotation="promax")




