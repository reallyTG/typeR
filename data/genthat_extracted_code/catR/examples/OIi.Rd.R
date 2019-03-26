library(catR)


### Name: OIi
### Title: Observed information function (dichotomous and polytomous
###   models)
### Aliases: OIi

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)
 
 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])
 
 # Observed information functions 
 # (various th, x and D values)
 OIi(th = 0, tcals, x = 0)
 OIi(th = 0, tcals, x = 0, D = 1.702)
 OIi(th = 0, tcals, x = 1)
 OIi(th = 1, tcals, x = 1)


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, m.GRM, model = "GRM")

 # Observed information functions (various th values)
 OIi(th = 0, m.GRM, x, model = "GRM")
 OIi(th = 1, m.GRM, x, model = "GRM")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Creation of a response pattern (true ability level 0)
 set.seed(1)
 x <- genPattern(0, cat_pav, model = "GPCM")

 # Observed information functions (various 'th' values)
 OIi(th = 0, cat_pav, x, model = "GPCM")
 OIi(th = 1, cat_pav, x, model = "GPCM")
 


