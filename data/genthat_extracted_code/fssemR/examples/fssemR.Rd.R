library(fssemR)


### Name: fssemR
### Title: Solving Sparse Structural Equation Model
### Aliases: fssemR package-fssemR fssemR-package

### ** Examples

seed = as.numeric(Sys.time())
N = 100                                           # sample size
Ng = 5                                            # gene number
Nk = 5 * 3                                        # eQTL number
Ns = 1                                            # sparse ratio
sigma2 = 0.01                                     # sigma2
set.seed(seed)
library(fssemR)
data = randomFSSEMdata(n = N, p = Ng, k = Nk, sparse = Ns, df = 0.3, sigma2 = sigma2,
                       u = 5, type = "DG", nhub = 1, dag = TRUE)
gamma = cv.multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, ngamma = 20, nfold = 5,
                           N, Ng, Nk)
fit   = multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, gamma, N, Ng, Nk,
                      trans = FALSE)
Xs    = data$Data$X
Ys    = data$Data$Y
Sk    = data$Data$Sk

## cross-validation
## cvfitc <- cv.multiFSSEMiPALM(Xs = Xs, Ys = Ys, Bs = fit$Bs, Fs = fit$Fs, Sk = Sk,
##                              sigma2 = fit$sigma2, nlambda = 10, nrho = 10,
##                              nfold = 5, p = Ng, q = Nk, wt = TRUE)

fitm <- opt.multiFSSEMiPALM(Xs = Xs, Ys = Ys, Bs = fit$Bs, Fs = fit$Fs, Sk = Sk,
                           sigma2 = fit$sigma2, nlambda = 10, nrho = 10,
                           p = Ng, q = Nk, wt = TRUE)

fitc0 <- fitm$fit

(TPR(fitc0$B[[1]], data$Vars$B[[1]]) + TPR(fitc0$B[[2]], data$Vars$B[[2]])) / 2
(FDR(fitc0$B[[1]], data$Vars$B[[1]]) + FDR(fitc0$B[[2]], data$Vars$B[[2]])) / 2
TPR(fitc0$B[[1]] - fitc0$B[[2]], data$Vars$B[[1]] - data$Vars$B[[2]])
FDR(fitc0$B[[1]] - fitc0$B[[2]], data$Vars$B[[1]] - data$Vars$B[[2]])



