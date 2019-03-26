library(catR)


### Name: MWI
### Title: Maximum likelihood weighted information (MLWI) and maximum
###   posterior weighted information (MPWI)
### Aliases: MWI

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

 # MLWI for item 1
 MWI(bank, 1, x, it.given)

 # MPWI for item 1
 MWI(bank, 1, x, it.given, type = "MPWI")

 # MLWI for item 1, different integration range
 MWI(bank, 1, x, it.given, lower = -2, upper = 2, nqp = 20)

 # MPWI for item 1, uniform prior distribution on the range [-2,2]
 MWI(bank, 1, x, it.given, type = "MPWI", priorDist = "unif", priorPar = c(-2, 2))


## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- m.GRM[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GRM")

 # MLWI for item 1
 MWI(m.GRM, 1, x, it.given, model = "GRM")

 # MPWI for item 1
 MWI(m.GRM, 1, x, it.given, model = "GRM", type = "MPWI")

 # MLWI for item 1, different integration range
 MWI(m.GRM, 1, x, it.given, model = "GRM", lower = -2, upper = 2, nqp = 20)

 # MPWI for item 1, uniform prior distribution on the range [-2,2]
 MWI(m.GRM, 1, x, it.given, model = "GRM", type = "MPWI", priorDist = "unif", 
 priorPar = c(-2, 2))


 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Selection of two arbitrary items (15 and 20) 
 it.given <- cat_pav[c(15, 20),]

 # Generation of a response pattern (true ability level 0)
 x <- genPattern(0, it.given, model = "GPCM")

  # MLWI for item 1
 MWI(cat_pav, 1, x, it.given, model = "GPCM")

 # MPWI for item 1
 MWI(cat_pav, 1, x, it.given, model = "GPCM", type = "MPWI")

 # MLWI for item 1, different integration range
 MWI(cat_pav, 1, x, it.given, model = "GPCM", lower = -2, upper = 2, nqp = 20)

 # MPWI for item 1, uniform prior distribution on the range [-2,2]
 MWI(cat_pav, 1, x, it.given, model = "GPCM", type = "MPWI", priorDist = "unif", 
 priorPar = c(-2, 2))
 


