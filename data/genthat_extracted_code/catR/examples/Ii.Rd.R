library(catR)


### Name: Ii
### Title: Item information functions, first and second derivatives
###   (dichotomous and polytomous models)
### Aliases: Ii

### ** Examples


## Dichotomous models ##
 
 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Item information functions and derivatives
 # (various th and D values)
 Ii(th = 0, tcals)
 Ii(th = 0, tcals, D = 1.702)
 Ii(th = 1, tcals)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Computation of item information and derivatives for ability level 0
 Ii(0, m.GRM, model = "GRM")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Computation of item information and derivatives for ability level 1
 Ii(1, cat_pav, model = "GPCM")
 


