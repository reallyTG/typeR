library(mstR)


### Name: genDichoMatrix
### Title: Item bank generation (dichotomous models)
### Aliases: genDichoMatrix

### ** Examples


 # Item bank generation with 500 items
 genDichoMatrix(items = 500)

 # Item bank generation with 100 items, 2PL model and log-normal distribution with 
 # parameters (0, 0.1225) for discriminations
 genDichoMatrix(items = 100, model = "2PL", aPrior = c("lnorm", 0, 0.1225))

 # A completely identical method as for previous example
 genDichoMatrix(items = 100, aPrior = c("lnorm", 0, 0.1225), 
  cPrior = c("unif", 0, 0), dPrior = c("unif", 1, 1))
 


