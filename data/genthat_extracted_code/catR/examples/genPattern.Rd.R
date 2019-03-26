library(catR)


### Name: genPattern
### Title: Random generation of item response patterns under dichotomous
###   and polytomous IRT models
### Aliases: genPattern

### ** Examples


## Dichotomous models ##
 
 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Generation of a response pattern for ability level 0
 genPattern(th = 0, tcals)

 # Generation of 10 response patterns for ability levels randomly drawn from N(0,1)
 genPattern(th = rnorm(10), tcals)

 # Generation of a single response for the first item only
 genPattern(th = 0, tcals[1,])

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Generation of a response pattern for ability level 0
 genPattern(0, m.GRM, model = "GRM")

 # Generation of 10 response patterns for ability levels randomly drawn from N(0,1)
 genPattern(rnorm(10), m.GRM, model = "GRM")

 # Generation of a single response for the first item only
 genPattern(0, m.GRM[1,], model = "GRM")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Generation of a response pattern for ability level 0
 genPattern(0, cat_pav, model = "GPCM")

 # Generation of a single response for the first item only
 genPattern(0, cat_pav[1,], model = "GPCM")
 


