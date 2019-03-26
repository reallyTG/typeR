library(spaMM)


### Name: corrMatrix
### Title: Using a corrMatrix argument
### Aliases: corrMatrix

### ** Examples

data("blackcap") 
## Here we manually reconstruct the correlation matrix 
##  of the ML fit produced by corrHLfit:
MLcorMat <- MaternCorr(proxy::dist(blackcap[,c("latitude","longitude")]),
                        nu=0.6285603,rho=0.0544659)
blackcap$name <- as.factor(rownames(blackcap))                
## (1) Single variable present in the data 
HLCor(migStatus ~ means+ corrMatrix(1|name),data=blackcap,
      corrMatrix=MLcorMat,HLmethod="ML")
## (2) Same, permuted: still gives correct result
perm <- sample(14)
# Permuted matrix (with permuted names)
pmat <- as.matrix(MLcorMat)[perm,perm]
HLCor(migStatus ~ means+ corrMatrix(1|name),data=blackcap,
      corrMatrix=as.dist(pmat),HLmethod="ML")
## (3) Other grouping terms:
HLCor(migStatus ~ means+ corrMatrix(1|latitude+longitude),data=blackcap,
      corrMatrix=MLcorMat,HLmethod="ML")



