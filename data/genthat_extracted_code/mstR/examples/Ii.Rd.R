library(mstR)


### Name: Ii
### Title: Item information functions, first and second derivatives
###   (dichotomous and polytomous models)
### Aliases: Ii

### ** Examples


## Dichotomous models ##
 
 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)
 
 # Item information functions and derivatives
 # (various th and D values)
 Ii(th = 0, m.3PL)
 Ii(th = 0, m.3PL, D = 1.702)
 Ii(th = 1, m.3PL)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of item information and derivatives for ability level 0
 Ii(0, m.GRM, model = "GRM")

 # Generation of a item bank under PCM with 20 items and at most 3 categories
 m.PCM <- genPolyMatrix(20, 3, "PCM")
 m.PCM <- as.matrix(m.PCM)

 # Computation of item information and derivatives for ability level 1
 Ii(1, m.PCM, model = "PCM")
 


