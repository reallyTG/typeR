library(mstR)


### Name: genPattern
### Title: Random generation of item response patterns under dichotomous
###   and polytomous IRT models
### Aliases: genPattern

### ** Examples


## Dichotomous models ##
 
 # Generation of an item bank under 3PL with 100 items 
 m.3PL <- genDichoMatrix(100, model = "3PL")
 m.3PL <- as.matrix(m.3PL)
 
 # Generation of a response pattern for ability level 0
 genPattern(th = 0, m.3PL)

 # Generation of a single response for the first item only
 genPattern(th = 0, m.3PL[1,])

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Generation of a response pattern for ability level 0
 genPattern(0, m.GRM, model = "GRM")

 # Generation of a single response for the first item only
 genPattern(0, m.GRM[1,], model = "GRM")

 # Generation of a item bank under PCM with 20 items and at most 3 categories
 m.PCM <- genPolyMatrix(20, 3, "PCM")
 m.PCM <- as.matrix(m.PCM)

 # Generation of a response pattern for ability level 0
 genPattern(0, m.PCM, model = "PCM")

 # Generation of a single response for the first item only
 genPattern(0, m.PCM[1,], model = "PCM")
 


