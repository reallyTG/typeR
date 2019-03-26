library(GPM)


### Name: Fit
### Title: The Fitting Function of 'GPM' Package
### Aliases: Fit

### ** Examples

# 1D example: Fit a model (with default settings) and evaluate the performance
# by computing the root mean squared error (RMSE) in prediction.
library(lhs)
X <- 5*maximinLHS(15, 1)
Y <- 2*sin(2*X) + log(X+1)
M <- Fit(X, Y)
XF <- matrix(seq(0, 5, length.out = 100), 100, 1)
YF <- Predict(XF, M)
RMSE <- sqrt(mean((YF$YF - (2*sin(2*XF) + log(XF+1)))^2))

## Not run: 
##D # 1D example: Fit a model, evaluate the performance, and plot the response
##D # along with 95% prediction interval
##D X <- 10*maximinLHS(10, 1) - 5
##D Y <- X*cos(X)
##D M <- Fit(X, Y)
##D XF <- matrix(seq(-5, 5, length.out = 500), 500, 1)
##D YF <- Predict(XF, M)
##D RMSE <- sqrt(mean((YF$YF - (XF*cos(XF)))^2))
##D Draw(M, 1, res = 20)
##D 
##D # 2D example: Fit a model, evaluate the performance, and plot the response
##D # surface along with 95% prediction interval
##D X <- 2*maximinLHS(10, 2) - 1
##D Y <- X[, 1]^2 + X[, 2]^2
##D M <- Fit(X, Y, CorrType = "PE")
##D XF <- 2*maximinLHS(100, 2) - 1
##D YF <- Predict(XF, M)
##D RMSE <- sqrt(mean((YF$YF - (XF[, 1]^2 + XF[, 2]^2))^2))
##D library(lattice)
##D Draw(M, c(1, 1), res = 15, PI95=1)
##D 
##D # 2D example: Plot the previous model wrt X1 in the [-2, 2]
##D # interval with X2=1
##D Draw(M, c(1, 0), LB = -2, UB = 2, res = 15, PI95=1)
##D 
##D # 3D example: Compare the performance of Gaussian ("G") and lifted Browninan
##D # with Gamma=1 ("LBG")
##D X <- 2*maximinLHS(50, 3) - 1
##D Y <- cos(X[, 1]^2) + 2*sin(X[, 2]^2) + X[, 3]^2
##D M_G <- Fit(X, Y)
##D M_LBG <- Fit(X, Y, CorrType = "LBG")
##D XF <- 2*maximinLHS(500, 3) - 1
##D YF_G <- Predict(XF, M_G)
##D YF_LBG <- Predict(XF, M_LBG)
##D RMSE_G <- sqrt(mean((YF_G$YF - (cos(XF[, 1]^2) + 2*sin(XF[, 2]^2) + XF[, 3]^2))^2))
##D RMSE_LBG <- sqrt(mean((YF_LBG$YF - (cos(XF[, 1]^2) + 2*sin(XF[, 2]^2) + XF[, 3]^2))^2))
##D 
##D # 3D example: Draw the response in 2D using the M_G model when X3=0
##D Draw(M_G, c(1, 1, 0), PI95 = 0, Values = 0, X1Label = 'Input 1', X2Label = 'Input 2')
##D 
##D # 3D example: 2D response
##D X <- 2*maximinLHS(50, 3) - 1
##D Y <- cbind(cos(X[, 1]^2) + 2*sin(X[, 2]^2) + X[, 3]^2, rowSums(X))
##D M <- Fit(X, Y)
##D Draw(M, c(0, 1, 1), Response_ID = 2, Values = 0.5)
##D 
##D # 2D example with noise
##D X <- 2*maximinLHS(100, 2) - 1
##D Y <- X[, 1]^2 + X[, 2]^2 + matrix(rnorm(nrow(X), 0, .5), nrow(X), 1)
##D M <- Fit(X, Y)
##D # Estimating the noise variance (should be close to 0.5^2)
##D M$Details$Nug_opt*M$CovFunc$Parameters$Sigma2*M$Data$Yrange^2
## End(Not run)



