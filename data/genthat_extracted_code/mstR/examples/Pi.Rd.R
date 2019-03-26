library(mstR)


### Name: Pi
### Title: Item response probabilities, first, second and third derivatives
###   (dichotomous and polytomous models)
### Aliases: Pi

### ** Examples



## Dichotomous models ##

 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)
 
 # Response probabilities and derivatives (various th and D values)
 Pi(th = 0, m.3PL)
 Pi(th = 0, m.3PL, D = 1.702)
 Pi(th = 1, m.3PL)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of probabilities and derivatives for ability level 0
 Pi(0, m.GRM, model = "GRM")

 # Generation of a item bank under PCM with 20 items and at most 3 categories
 m.PCM <- genPolyMatrix(20, 3, "PCM")
 m.PCM <- as.matrix(m.PCM)

 # Computation of probabilities and derivatives for ability level 1
 Pi(1, m.PCM, model = "PCM")
 


