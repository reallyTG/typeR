library(catR)


### Name: Pi
### Title: Item response probabilities, first, second and third derivatives
###   (dichotomous and polytomous models)
### Aliases: Pi

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)
 
 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Response probabilities and derivatives (various th and D values)
 Pi(th = 0, tcals)
 Pi(th = 0, tcals, D = 1.702)
 Pi(th = 1, tcals)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of probabilities and derivatives for ability level 0
 Pi(0, m.GRM, model = "GRM")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Computation of probabilities and derivatives for ability level 1
 Pi(1, cat_pav, model = "GPCM")
 


