library(MCPMod)


### Name: planMM
### Title: Calculate planning quantities for MCPMod
### Aliases: planMM print.planMM
### Keywords: design

### ** Examples

# Example from JBS paper
doses <- c(0,10,25,50,100,150)
models <- list(linear = NULL, emax = 25,                               
               logistic = c(50, 10.88111), exponential= 85,            
               betaMod=matrix(c(0.33,2.31,1.39,1.39), byrow=TRUE, nrow=2))
plM <- planMM(models, doses, n = rep(50,6), alpha = 0.05, scal=200)
plot(plM)

## Not run: 
##D # example, where means are directly specified
##D # doses   
##D dvec <- c(0, 10, 50, 100)
##D # mean vectors
##D mu1 <- c(1, 2, 2, 2)
##D mu2 <- c(1, 1, 2, 2)
##D mu3 <- c(1, 1, 1, 2)
##D mMat <- cbind(mu1, mu2, mu3)
##D dimnames(mMat)[[1]] <- dvec
##D planMM(muMat = mMat, doses = dvec, n = 30)
## End(Not run)



