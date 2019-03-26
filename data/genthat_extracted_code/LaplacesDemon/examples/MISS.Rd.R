library(LaplacesDemon)


### Name: MISS
### Title: Multiple Imputation Sequential Sampling
### Aliases: MISS
### Keywords: Gibbs Sampler Imputation Utility

### ** Examples

#library(LaplacesDemon)
### Create Data
#N <- 20 #Number of Simulated Records
#J <- 5 #Number of Simulated Variables
#pM <- 0.25 #Percent Missing
#Sigma <- as.positive.definite(matrix(runif(J*J),J,J))
#X <- rmvn(N, rep(0,J), Sigma)
#m <- sample.int(N*J, round(pM*N*J))
#X[m] <- NA
#head(X)

### Begin Multiple Imputation
#Fit <- MISS(X, Iterations=100, Algorithm="GS", verbose=TRUE)
#Fit
#summary(Fit)
#plot(Fit)
#plot(BMK.Diagnostic(t(Fit$Imp)))

### Continue Updating if Necessary
#Fit <- MISS(X, Iterations=100, Algorithm="GS", Fit, verbose=TRUE)
#summary(Fit)
#plot(Fit)
#plot(BMK.Diagnostic(t(Fit$Imp)))

### Replace Missing Values in Data Set with Posterior Modes
#Ximp <- X
#Ximp[which(is.na(X))] <- Fit$PostMode

### Original and Imputed Data Sets
#head(X)
#head(Ximp)
#summary(X)
#summary(Ximp)

### or Multiple Data Sets, say 3
#Ximp <- array(X, dim=c(nrow(X), ncol(X), 3))
#for (i in 1:3) {
#     Xi <- X
#     Xi[which(is.na(X))] <- Fit$Imp[,sample.int(ncol(Fit$Imp), 1)]
#     Ximp[,,i] <- Xi}
#head(X)
#head(Ximp[,,1])
#head(Ximp[,,2])
#head(Ximp[,,3])

#End



