library(spaMM)


### Name: HLCor
### Title: Fits a (spatially) correlated mixed model, for given correlation
###   parameters
### Aliases: HLCor
### Keywords: model

### ** Examples

# Example with an adjacency matrix (autoregressive model):
# see 'adjacency' documentation page

#### Matérn correlation using only the Matern() syntax
if (spaMM.getOption("example_maxtime")>0.8) {
 data("Loaloa")
 HLCor(cbind(npos,ntot-npos)~elev1+elev2+elev3+elev4+maxNDVI1+seNDVI
              +Matern(1|longitude+latitude),data=Loaloa,
      family=binomial(),ranPars=list(nu=0.5,rho=1/0.7)) 
}

#### Matérn correlation using a distMatrix
data("blackcap")
MLdistMat <- as.matrix(proxy::dist(blackcap[,c("latitude","longitude")]))
HLCor(migStatus ~ means+ Matern(1|latitude+longitude),data=blackcap,
      distMatrix=MLdistMat,HLmethod="ML",ranPars=list(nu=0.6285603,rho=0.0544659))




