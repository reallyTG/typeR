library(MCPMod)


### Name: sampSize
### Title: Sample size calculations for MCPMod
### Aliases: sampSize print.sampSize
### Keywords: design

### ** Examples

## Not run: 
##D # example from JBS paper p.651
##D doses <- c(0,10,25,50,100,150)                                         
##D models <- list(linear = NULL, emax = c(25),                            
##D                logistic = c(50, 10.88111), exponential=c(85),          
##D                betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2))
##D sampSize(models, doses, base = 0, maxEff = 0.4, sigma = 1,             
##D          upperN = 80, scal = 200, alpha = 0.05)
##D # with different summary function
##D 
##D sampSize(models, doses, base = 0, maxEff = 0.4, sigma = 1,             
##D          upperN = 90, scal = 200, sumFct = median, alpha = 0.05)
##D 
##D # with unbalanced allocations (twice as many patients in placebo group
##D # than in active dose groups)
##D sampSize(models, doses, base = 0, maxEff = 0.4, sigma = 1,            
##D        alpha = 0.05, upperN = 80, scal = 200, alRatio=c(2,1,1,1,1,1))
##D # iterates total sample size instead of sample size in smallest arm
##D # in this case no big difference
##D sampSize(models, doses, base = 0, maxEff = 0.4, sigma = 1,
##D          alpha = 0.05, upperN = 500, scal = 200, typeN = "total",
##D          alRatio=c(2,1,1,1,1,1))
##D 
##D 
##D # sample size calculation for general matrix of means
##D dvec <- c(0, 10, 50, 100)                             
##D mu1 <- c(1, 2, 2, 2)                                  
##D mu2 <- c(1, 1, 2, 2)                                  
##D mu3 <- c(1, 1, 1, 2)                                  
##D mMat <- cbind(mu1, mu2, mu3)                          
##D dimnames(mMat)[[1]] <- dvec                           
##D sampSize(muMat = mMat, doses = dvec, sigma = 1,       
##D        alpha = 0.05, upperN = 10, alRatio=c(2,2,1,1))
## End(Not run)



