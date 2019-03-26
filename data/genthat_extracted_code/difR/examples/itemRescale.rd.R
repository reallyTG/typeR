library(difR)


### Name: itemRescale
### Title: Rescaling item parameters by equal means anchoring
### Aliases: itemRescale

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Splitting the data set into reference and focal groups
##D  nF <- sum(Gender)
##D  nR <- nrow(verbal)-nF
##D  data.ref <- verbal[,1:24][order(Gender),][1:nR,]
##D  data.focal <- verbal[,1:24][order(Gender),][(nR+1):(nR+nF),]
##D 
##D  # Estimating item parameters in each data set with 1PL model
##D  mR <- itemPar1PL(data.ref)
##D  mF <- itemPar1PL(data.focal)
##D 
##D  # Rescaling focal group item parameters, using all items for anchoring
##D  itemRescale(mR, mF)
##D 
##D  # Rescaling focal group item parameters, using the first 10 items for anchoring
##D  itemRescale(mR, mF, items = 1:10)
##D 
##D  # Estimating item parameters in each data set with 2PL model
##D  mR <- itemPar2PL(data.ref)
##D  mF <- itemPar2PL(data.focal)
##D 
##D  # Rescaling focal group item parameters, using all items for anchoring
##D  itemRescale(mR, mF)
##D  
## End(Not run)
 


