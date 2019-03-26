library(spaMM)


### Name: arabidopsis
### Title: Arabidopsis genetic and climatic data
### Aliases: arabidopsis
### Keywords: datasets

### ** Examples

data("arabidopsis")
if (spaMM.getOption("example_maxtime")>8) {
  HLCor(cbind(pos1046738,1-pos1046738)~seasonal+Matern(1|LAT+LONG),
        ranPars=list(rho=0.1192779,nu=0.2369892,lambda=8.599),
        family=binomial(),HLmethod="PQL/L",data=arabidopsis)
}
## The above ranPars are deduced from the following fit:
if (spaMM.getOption("example_maxtime")>46) {
  SNPfit <- fitme(cbind(pos1046738,1-pos1046738)~seasonal+Matern(1|LAT+LONG),
              verbose=c(TRACE=TRUE), 
              family=binomial(),method="PQL/L",data=arabidopsis)
  summary(SNPfit) # p_v=-125.0392
}



