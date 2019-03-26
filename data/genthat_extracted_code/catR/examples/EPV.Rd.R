library(catR)


### Name: EPV
### Title: Expected Posterior Variance (EPV)
### Aliases: EPV

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 bank <- as.matrix(tcals[,1:4])
 
 # Selection of two arbitrary items (15 and 20) of the
 # 'tcals' data set
 it.given <- bank[c(15,20),]

 # Creation of a response pattern
 x <- c(0, 1)

 # EPV for item 1, provisional ability level 0
 EPV(bank, 1, x, 0, it.given)

 # With prior standard deviation 2
 EPV(bank, 1, x, 0, it.given, priorPar = c(0,2))


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- m.GRM[c(15,20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GRM")

 # EPV for item 1, provisional ability level 0
 EPV(m.GRM, 1, x, 0, it.given, model = "GRM")

 # With prior standard deviation 2
 EPV(m.GRM, 1, x, 0, it.given, model = "GRM", priorPar = c(0, 2))


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- cat_pav[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GPCM")

 # EPV for item 1, provisional ability level 0
 EPV(cat_pav, 1, x, 0, it.given, model = "GPCM")

 # With prior standard deviation 2
 EPV(cat_pav, 1, x, 0, it.given, model = "GPCM", priorPar = c(0, 2))
 


