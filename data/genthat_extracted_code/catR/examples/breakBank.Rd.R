library(catR)


### Name: breakBank
### Title: Breaking the item bank in item parameters and group membership
###   (for content balancing)
### Aliases: breakBank

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Breaking 'tcals'
 breakBank(tcals)


## Polytomous models ##

 # Creation of the 'cbList' list with arbitrary proportions
 cbList <- list(names =c ("Audio1", "Audio2", "Written1", "Written2",
        "Written3"), props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 # NRM with 100 items
 mat <- genPolyMatrix(100, 4, model = "NRM", cbControl = cbList)

 # Breaking 'mat'
 breakBank(mat)
 


