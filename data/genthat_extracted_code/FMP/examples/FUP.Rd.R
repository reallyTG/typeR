library(FMP)


### Name: FUP
### Title: Estimate the coefficients of a filtered unconstrained polynomial
###   IRT model
### Aliases: FUP
### Keywords: statistics

### ** Examples

## Not run: 
##D NSubjects <- 2000
##D 
##D 
##D ## generate sample k=1 FMP data
##D b <- matrix(c(
##D     #b0    b1     b2    b3      b4   b5 b6 b7  k
##D   1.675, 1.974, -0.068, 0.053,  0,  0,  0,  0, 1,
##D   1.550, 1.805, -0.230, 0.032,  0,  0,  0,  0, 1,
##D   1.282, 1.063, -0.103, 0.003,  0,  0,  0,  0, 1,
##D   0.704, 1.376, -0.107, 0.040,  0,  0,  0,  0, 1,
##D   1.417, 1.413,  0.021, 0.000,  0,  0,  0,  0, 1,
##D  -0.008, 1.349, -0.195, 0.144,  0,  0,  0,  0, 1,
##D   0.512, 1.538, -0.089, 0.082,  0,  0,  0,  0, 1,
##D   0.122, 0.601, -0.082, 0.119,  0,  0,  0,  0, 1,
##D   1.801, 1.211,  0.015, 0.000,  0,  0,  0,  0, 1,
##D  -0.207, 1.191,  0.066, 0.033,  0,  0,  0,  0, 1,
##D  -0.215, 1.291, -0.087, 0.029,  0,  0,  0,  0, 1,
##D   0.259, 0.875,  0.177, 0.072,  0,  0,  0,  0, 1,
##D  -0.423, 0.942,  0.064, 0.094,  0,  0,  0,  0, 1,
##D   0.113, 0.795,  0.124, 0.110,  0,  0,  0,  0, 1,
##D   1.030, 1.525,  0.200, 0.076,  0,  0,  0,  0, 1,
##D   0.140, 1.209,  0.082, 0.148,  0,  0,  0,  0, 1,
##D   0.429, 1.480, -0.008, 0.061,  0,  0,  0,  0, 1,
##D   0.089, 0.785, -0.065, 0.018,  0,  0,  0,  0, 1,
##D  -0.516, 1.013,  0.016, 0.023,  0,  0,  0,  0, 1,
##D   0.143, 1.315, -0.011, 0.136,  0,  0,  0,  0, 1,
##D   0.347, 0.733, -0.121, 0.041,  0,  0,  0,  0, 1,
##D  -0.074, 0.869,  0.013, 0.026,  0,  0,  0,  0, 1,
##D   0.630, 1.484, -0.001, 0.000,  0,  0,  0,  0, 1), 
##D   nrow=23, ncol=9, byrow=TRUE)  
##D  
##D # generate data using the above item parameters 
##D ex1.data<-genFMPData(NSubj = NSubjects, bParams = b, seed = 345)$data
##D 
##D NItems <- ncol(ex1.data)
##D 
##D # compute (initial) surrogate theta values from 
##D # the normed left singular vector of the centered 
##D # data matrix
##D thetaInit <- svdNorm(ex1.data)
##D 
##D # Choose model
##D k <- 1  # order of polynomial = 2k+1
##D 
##D # Initialize matrices to hold output
##D if(k == 0) {
##D   startVals <- c(1.5, 1.5)
##D   bmat <- matrix(0,NItems,6)
##D   colnames(bmat) <- c(paste("b", 0:1, sep = ""),"FHAT", "AIC", "BIC", "convergence") 
##D }
##D 
##D if(k == 1) {
##D   startVals <- c(1.5, 1.5, .10, .10)
##D   bmat <- matrix(0,NItems,8)
##D   colnames(bmat) <- c(paste("b", 0:3, sep = ""),"FHAT", "AIC", "BIC", "convergence") 
##D }
##D 
##D if(k == 2) {
##D   startVals <- c(1.5, 1.5, .10, .10, .10, .10)
##D   bmat <- matrix(0,NItems,10)
##D   colnames(bmat) <- c(paste("b", 0:5, sep = ""),"FHAT", "AIC", "BIC", "convergence") 
##D }
##D 
##D if(k == 3) {
##D   startVals <- c(1.5, 1.5, .10, .10, .10, .10, .10, .10)
##D   bmat <- matrix(0,NItems,12)
##D   colnames(bmat) <- c(paste("b", 0:7, sep = ""),"FHAT", "AIC", "BIC", "convergence") 
##D }   
##D 
##D 
##D # estimate item parameters and fit statistics
##D for(i in 1:NItems){
##D   out<-FUP(data = ex1.data,thetaInit = thetaInit, item = i, startvals = startVals, k = k)
##D   Nb <- length(out$b)
##D   bmat[i,1:Nb] <- out$b
##D   bmat[i,Nb+1] <- out$FHAT
##D   bmat[i,Nb+2] <- out$AIC
##D   bmat[i,Nb+3] <- out$BIC
##D   bmat[i,Nb+4] <- out$convergence
##D }
##D 
##D # print results
##D print(bmat)
## End(Not run)



