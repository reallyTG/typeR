library(fssemR)


### Name: multiFSSEMiPALM
### Title: multiFSSEMiPALM
### Aliases: multiFSSEMiPALM

### ** Examples

seed = 1234
N = 100                                           # sample size
Ng = 5                                            # gene number
Nk = 5 * 3                                        # eQTL number
Ns = 1                                            # sparse ratio
sigma2 = 0.01                                     # sigma2
set.seed(seed)
library(fssemR)
data = randomFSSEMdata(n = N, p = Ng, k = Nk, sparse = Ns, df = 0.3, sigma2 = sigma2,
                       u = 5, type = "DG", nhub = 1, dag = TRUE)
## If we assume that different condition has different genetics perturbations (eQTLs)
## gamma = cv.multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, ngamma = 20, nfold = 5,
##                            N, Ng, Nk)
gamma = 0.6784248     ## optimal gamma computed by cv.multiRegression
fit   = multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, gamma, N, Ng, Nk,
                      trans = FALSE)
Xs    = data$Data$X
Ys    = data$Data$Y
Sk    = data$Data$Sk


cvfitc <- cv.multiFSSEMiPALM(Xs = Xs, Ys = Ys, Bs = fit$Bs, Fs = fit$Fs, Sk = Sk,
                             sigma2 = fit$sigma2, nlambda = 5, nrho = 5,
                             nfold = 5, p = Ng, q = Nk, wt = TRUE)

fitc0 <- multiFSSEMiPALM(Xs = Xs, Ys = Ys, Bs = fit$Bs, Fs = fit$Fs, Sk = Sk,
                         sigma2 = fit$sigma2, lambda = cvfitc$lambda, rho = cvfitc$rho,
                         Wl = inverseB(fit$Bs), Wf = flinvB(fit$Bs),
                         p = Ng, maxit = 100, threshold = 1e-5, sparse = TRUE, 
                         verbose = TRUE, trans = TRUE, strict = TRUE)


(TPR(fitc0$B[[1]], data$Vars$B[[1]]) + TPR(fitc0$B[[2]], data$Vars$B[[2]])) / 2
(FDR(fitc0$B[[1]], data$Vars$B[[1]]) + FDR(fitc0$B[[2]], data$Vars$B[[2]])) / 2
TPR(fitc0$B[[1]] - fitc0$B[[2]], data$Vars$B[[1]] - data$Vars$B[[2]])
FDR(fitc0$B[[1]] - fitc0$B[[2]], data$Vars$B[[1]] - data$Vars$B[[2]])



