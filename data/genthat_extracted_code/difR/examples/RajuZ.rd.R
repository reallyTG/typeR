library(difR)


### Name: RajuZ
### Title: Raju's area DIF statistic
### Aliases: RajuZ

### ** Examples

## Not run: 
##D 
##D  # Loading of the verbal data
##D  data(verbal)
##D  attach(verbal)
##D 
##D  # Splitting the data into reference and focal groups
##D  nF <- sum(Gender)
##D  nR <- nrow(verbal)-nF
##D  data.ref <- verbal[,1:24][order(Gender),][1:nR,]
##D  data.focal <- verbal[,1:24][order(Gender),][(nR+1):(nR+nF),]
##D 
##D  # Pre-estimation of the item parameters (1PL model)
##D  mR <- itemParEst(data.ref,model = "1PL")
##D  mF <- itemParEst(data.focal,model = "1PL")
##D  mF <- itemRescale(mR, mF)
##D 
##D  # Signed and unsigned Raju statistics
##D  RajuZ(mR, mF)
##D  RajuZ(mR, mF, signed = TRUE)
##D 
##D  # Pre-estimation of the item parameters (2PL model)
##D  mR <- itemParEst(data.ref, model = "2PL")
##D  mF <- itemParEst(data.focal, model = "2PL")
##D  mF <- itemRescale(mR, mF)
##D 
##D  # Signed and unsigned Raju statistics
##D  RajuZ(mR, mF)
##D  RajuZ(mR, mF, signed = TRUE)
##D  
##D  # Pre-estimation of the item parameters (constrained 3PL model)
##D  mR <- itemParEst(data.ref, model = "3PL", c = 0.05)
##D  mF <- itemParEst(data.focal, model = "3PL", c =0 .05)
##D  mF <- itemRescale(mR, mF)
##D  
##D  # Signed and unsigned Raju statistics
##D  RajuZ(mR, mF)
##D  RajuZ(mR, mF, signed = TRUE)
##D  
## End(Not run)
 


