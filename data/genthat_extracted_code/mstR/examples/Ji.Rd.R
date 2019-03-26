library(mstR)


### Name: Ji
### Title: Function J(theta) for weighted likelihood estimation
###   (dichotomous and polytomous IRT models)
### Aliases: Ji

### ** Examples


## Dichotomous models ##
 
 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)
 
 # Various J functions and derivatives
 # (various th and D values)
 Ji(th = 0, m.3PL)
 Ji(th = 0, m.3PL, D = 1.702)
 Ji(th = 1, m.3PL)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of J function and derivatives for ability level 0
 Ji(0, m.GRM, model = "GRM")

 # Generation of a item bank under PCM with 20 items and at most 3 categories
 m.PCM <- genPolyMatrix(20, 3, "PCM")
 m.PCM <- as.matrix(m.PCM)

 # Computation of J function and derivatives for ability level 1
 Ji(1, m.PCM, model = "PCM")
 


