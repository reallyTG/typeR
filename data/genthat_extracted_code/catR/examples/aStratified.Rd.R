library(catR)


### Name: aStratified
### Title: Item membership assessment for a-stratified sampling
### Aliases: aStratified

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Selecting item parameters only
 tcals <- as.matrix(tcals[,1:4])

 # Creation of five strata with equal length (17 items each)
 aStratified(tcals, 5)

 # Creation of four strata with prespecified lengths 
 res <- aStratified(tcals, K = c(20, 25, 10, 30))
 table(res) # as expected


## Polytomous models ##

 # GRM with 100 items
 mat <- genPolyMatrix(100, 4, model = "GRM")

 # Creation of four strata with equal length (25 items each)
 aStratified(mat, 5, model = "GRM")
 


