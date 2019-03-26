library(catR)


### Name: startItems
### Title: Selection of the first items
### Aliases: startItems

### ** Examples


## Dichotomous models ##

 # Loading the 'tcals' parameters 
 data(tcals)

 # Item bank creation with 'tcals' item parameters
 bank <- as.matrix(tcals[,1:4])
 
 # Random selection of 4 starting items
 startItems(bank, seed = 1, nrItems = 4)

 # Random selection of 4 starting items without fixing the seed
 startItems(bank, seed = NA, nrItems = 4)
 startItems(bank, seed = NA, nrItems = 4) # may provide a different result!

 ## With content balancing control
 prov <- breakBank(tcals)
 cbGroup <- prov$cbGroup

 # Creation of the 'cbList' list with arbitrary proportions
 cbList <- list(names = c("Audio1", "Audio2", "Written1", "Written2", "Written3"), 
        props = c(0.1, 0.2, 0.2, 0.2, 0.3))

 startItems(bank, seed = 1, nrItems = 3, cbControl = cbList, cbGroup = cbGroup)
 startItems(bank, seed = NA, nrItems = 3, cbControl = cbList, cbGroup = cbGroup,
            random.cb = 1)

 # Selection of the first 5 starting items
 startItems(bank, fixItems = 1:5)

 # Selecting 1 starting item, initial ability estimate is 0
 startItems(bank) 

 # Selecting 3 starting items for ability levels -1, 0 and 2
 startItems(bank, theta = c(-1, 0, 2)) 

 # Same with 5 randomesque items per theta value
 startItems(bank, theta = c(-1, 0, 2), randomesque = 5)

 # 5 randomesque items per theta value, with fixed random seed number
 startItems(bank, theta = c(-1, 0, 2), randomesque = 5, random.seed = 1) 

 # Idem but with 'bOpt' criterion
 startItems(bank, theta = c(-1, 0, 2), startSelect = "bOpt")

 # Selecting only the first 10 items as available items
 avail <- c(rep(1, 10), rep(0, nrow(bank)-10))
 startItems(bank, theta = c(-1, 0, 2), nAvailable = avail) 

## Not run: 
##D  # Selecting too many items among available ones
##D  startItems(bank, nrItems = 11, theta = 2, halfRange = 3, nAvailable = avail) 
## End(Not run)

## Polytomous models ##

 # Generation of an item bank under GRM with 100 items and at most 4 categories
 m.GRM <- genPolyMatrix(100, 4, "GRM")
 m.GRM <- as.matrix(m.GRM)

 # Random selection of 4 starting items
 startItems(m.GRM, model = "GRM", seed = 1, nrItems = 4)

 # Selection of the first 5 starting items
 startItems(m.GRM, model = "GRM", fixItems = 1:5)

 # Selecting 3 starting items for theta values -1, 0 and 2
 startItems(m.GRM, model = "GRM", theta = c(-1, 0, 2))

## Not run: 
##D 
##D  # Idem but with 'bOpt' criterion
##D  startItems(m.GRM, model = "GRM", nrItems = 3, theta = 1, halfRange = 2, 
##D             startSelect = "bOpt")
##D  
## End(Not run)

 # Selecting only the first 10 items as available items
 avail <- c(rep(1, 10), rep(0, nrow(m.GRM)-10))
 startItems(m.GRM, model = "GRM", theta = c(-1, 0, 2), 
            nAvailable = avail) 

## No test: 

 # Selecting too many items among available ones
 startItems(m.GRM, model = "GRM", theta = seq(from = -2, to = 2, length = 11), 
            nAvailable = avail) 
## End(No test)

 # Loading the cat_pav data
 data(cat_pav)
 cat_pav <- as.matrix(cat_pav)

 # Random selection of 4 starting items
 startItems(cat_pav, model = "GPCM", seed = 1, nrItems = 4)

 # Selection of the first 5 starting items
 startItems(cat_pav, model = "GPCM", fixItems = 1:5)

 # Selecting 3 starting items for theta values -1, 0 and 2
 startItems(cat_pav, model = "GPCM", theta = c(-1, 0, 2)) 

## Not run: 
##D 
##D  # Idem but with 'bOpt' criterion
##D  startItems(cat_pav, model = "GPCM", theta = c(-1, 0, 2), startSelect = "bOpt")
##D  
## End(Not run)

 # Selecting only the first 10 items as available items
 avail <- c(rep(1, 10), rep(0, nrow(cat_pav)-10))
 startItems(cat_pav, model = "GPCM", theta = c(-1, 0, 2), nAvailable = avail) 

## Not run: 
##D 
##D  # Selecting too many items among available ones
##D  startItems(cat_pav, model = "GPCM", theta = seq(from = -2, to = 2, length = 11), 
##D             nAvailable = avail) 
##D  
## End(Not run)
 


