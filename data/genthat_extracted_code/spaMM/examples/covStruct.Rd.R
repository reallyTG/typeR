library(spaMM)


### Name: covStruct
### Title: Specifying correlation structures
### Aliases: covStruct Predictor as_precision

### ** Examples

## Not run: 
##D data("blackcap") 
##D # a 'dist' object can be used to specify a corrMatrix:  
##D MLdistMat <- MaternCorr(proxy::dist(blackcap[,c("latitude","longitude")]),
##D                         nu=0.6285603,rho=0.0544659) # a 'dist' object!
##D blackcap$name <- as.factor(rownames(blackcap))     
##D HLCor(migStatus ~ means + corrMatrix(1|name), data=blackcap,
##D       corrMatrix=MLdistMat, HLmethod="ML")
##D #### Same result by different input and algorithm:
##D HLCor(migStatus ~ means + corrMatrix(1|name), data=blackcap,
##D       covStruc=list(precision=as_precision(MLdistMat)), HLmethod="ML")
##D # Manual version of the same:
##D m <- as.matrix(MLdistMat) ## leaves 0 on the diagonal! 
##D diag(m) <- 1 ## so that m is true correlation matrix 
##D prec_mat <- solve(m) ## precision factor matrix
##D HLCor(migStatus ~ means + corrMatrix(1|name), data=blackcap,
##D       covStruc=list(precision=prec_mat), HLmethod="ML")
## End(Not run)



