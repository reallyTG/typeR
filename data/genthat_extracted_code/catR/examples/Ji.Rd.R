library(catR)


### Name: Ji
### Title: Function J(theta) for weighted likelihood estimation
###   (dichotomous and polytomous IRT models)
### Aliases: Ji

### ** Examples


## Dichotomous models ##
 
 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Various J functions and derivatives
 # (various th and D values)
 Ji(th = 0, tcals)
 Ji(th = 0, tcals, D = 1.702)
 Ji(th = 1, tcals)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of J function and derivatives for ability level 0
 Ji(0, m.GRM, model = "GRM")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Computation of J function and derivatives for ability level 1
 Ji(1, cat_pav, model = "GPCM")
 


