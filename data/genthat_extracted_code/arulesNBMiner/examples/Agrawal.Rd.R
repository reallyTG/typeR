library(arulesNBMiner)


### Name: Agrawal
### Title: Synthetic Example Dataset Agrawal
### Aliases: Agrawal Agrawal.pat Agrawal.db
### Keywords: datasets

### ** Examples

data(Agrawal)

summary(Agrawal.pat)
summary(Agrawal.db)

## the data sets was generated with the following code
## Not run: 
##D Agrawal.pat <- random.patterns(1000, nPats = 2000,  method = "agrawal", 
##D     lPats = 2, corr = 0.5, cmean = 0.5, cvar = 0.1, iWeight = NULL,
##D     verbose = FALSE)
##D Agrawal.db <- random.transactions(1000, 20000, method="agrawal", 
##D     patterns = Agrawal.pat)
## End(Not run) 



