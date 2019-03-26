library(simPop)


### Name: getCat
### Title: Categorize (semi-)continuous variables
### Aliases: getCat
### Keywords: manip

### ** Examples


data(eusilcS)

## semi-continuous variable
breaks <- getBreaks(eusilcS$netIncome, 
    weights=eusilcS$rb050, equidist = FALSE)
netIncomeCat <- getCat(eusilcS$netIncome, breaks)
summary(netIncomeCat)




