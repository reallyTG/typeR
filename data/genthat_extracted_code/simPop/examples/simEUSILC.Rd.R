library(simPop)


### Name: simEUSILC
### Title: Simulate EU-SILC population data
### Aliases: simEUSILC
### Keywords: datagen

### ** Examples


data(eusilcS) # load sample data

## Not run: 
##D ## long computation time
##D # multinomial model with random draws
##D eusilcM <- simEUSILC(eusilcS, upper = 200000, equidist = FALSE)
##D summary(eusilcM)
##D 
##D # two-step regression
##D eusilcT <- simEUSILC(eusilcS, method = "twostep")
##D summary(eusilcT)
## End(Not run)




