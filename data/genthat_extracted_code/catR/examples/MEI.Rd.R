library(catR)


### Name: MEI
### Title: (Maximum) Expected Information (MEI)
### Aliases: MEI

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 bank <- as.matrix(tcals[,1:4])
 
 # Selection of two arbitrary items (15 and 20) of the
 # 'tcals' data set
 it.given <- bank[c(15, 20),]

 # Creation of a response pattern
 x <- c(0, 1)

 # MEI for item 1, provisional ability level 0
 MEI(bank, 1, x, 0, it.given)

 # With Fisher information instead
 MEI(bank, 1, x, 0, it.given, infoType = "Fisher")

 # With WL estimator instead
 MEI(bank, 1, x, 0, it.given, method = "WL")


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Selection of two arbitrary items (15 and 20) 
it.given <- m.GRM[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GRM")

 # EPV for item 1, provisional ability level 0
 MEI(m.GRM, 1, x, 0, it.given, model = "GRM")

 # With WL method
 MEI(m.GRM, 1, x, 0, it.given, model = "GRM", method = "WL")

 # With Fisher information
 MEI(m.GRM, 1, x, 0, it.given, model = "GRM", infoType = "Fisher")

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- cat_pav[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GPCM")

 # EPV for item 1, provisional ability level 0
 MEI(cat_pav, 1, x, 0, it.given, model = "GPCM")

 # With WL method
 MEI(cat_pav, 1, x, 0, it.given, model = "GPCM", method = "WL")

 # With Fisher information
 MEI(cat_pav, 1, x, 0, it.given, model = "GPCM", infoType = "Fisher") 
 


