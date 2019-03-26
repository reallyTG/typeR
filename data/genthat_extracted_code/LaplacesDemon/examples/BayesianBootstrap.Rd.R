library(LaplacesDemon)


### Name: BayesianBootstrap
### Title: The Bayesian Bootstrap
### Aliases: BayesianBootstrap
### Keywords: Utility

### ** Examples

library(LaplacesDemon)

#Example 1: Samples
x <- 1:2
BB <- BayesianBootstrap(X=x, n=100, Method="weights"); BB

#Example 2: Mean, Univariate
x <- 1:2
BB <- BayesianBootstrap(X=x, n=100, Method=weighted.mean); BB

#Example 3: Mean, Multivariate
data(demonsnacks)
BB <- BayesianBootstrap(X=demonsnacks, n=100,
     Method=function(x,w) apply(x, 2, weighted.mean, w=w)); BB

#Example 4: Correlation
dye <- c(1.15, 1.70, 1.42, 1.38, 2.80, 4.70, 4.80, 1.41, 3.90)
efp <- c(1.38, 1.72, 1.59, 1.47, 1.66, 3.45, 3.87, 1.31, 3.75)
X <- matrix(c(dye,efp), length(dye), 2)
colnames(X) <- c("dye","efp")
BB <- BayesianBootstrap(X=X, n=100,
     Method=function(x,w) cov.wt(x, w, cor=TRUE)$cor); BB

#Example 5: Marginal Posterior Covariance
#The following example is commented out due to package build time.
#To run the following example, use the code from the examples in
#the LaplaceApproximation function for the data, model specification
#function, and initial values. Then perform the Laplace
#Approximation as below (with CovEst="Identity" and sir=FALSE) until
#convergence, set the latest initial values, then use the Bayesian
#bootstrap on the data, run the Laplace Approximation again to
#convergence, save the posterior modes, and repeat until S samples
#of the posterior modes are collected. Finally, calculate the
#parameter covariance or standard deviation.

#Fit <- LaplaceApproximation(Model, Initial.Values, Data=MyData,
#     Iterations=1000, Method="SPG",  CovEst="Identity", sir=FALSE)
#Initial.Values <- as.initial.values(Fit)
#S <- 100 #Number of bootstrapped sets of posterior modes (parameters)
#Z <- rbind(Fit$Summary1[,1]) #Bootstrapped parameters collected here
#N <- nrow(MyData$X) #Number of records
#MyData.B <- MyData
#for (s in 1:S) {
#     cat("\nIter:", s, "\n")
#     BB <- BayesianBootstrap(MyData$y, n=N)
#     z <- apply(BB, 2, function(x) sample.int(N, size=1, prob=x))
#     MyData.B$y <- MyData$y[z]
#     MyData.B$X <- MyData$X[z,]
#     Fit <- LaplaceApproximation(Model, Initial.Values, Data=MyData.B,
#          Iterations=1000, Method="SPG", CovEst="Identity", sir=FALSE)
#     Z <- rbind(Z, Fit$Summary1[,1])}
#cov(Z) #Bootstrapped marginal posterior covariance
#sqrt(diag(cov(Z))) #Bootstrapped marginal posterior standard deviations



