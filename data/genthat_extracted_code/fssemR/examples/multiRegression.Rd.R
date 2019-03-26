library(fssemR)


### Name: multiRegression
### Title: multiRegression
### Aliases: multiRegression

### ** Examples

seed = 1234
N = 100                                           # sample size
Ng = 5                                            # gene number
Nk = 5 * 3                                        # eQTL number
Ns = 1                                            # sparse ratio
sigma2 = 0.01                                     # sigma2
set.seed(seed)
data = randomFSSEMdata(n = N, p = Ng, k = Nk, sparse = Ns, df = 0.3, sigma2 = sigma2,
                       u = 5, type = "DG", nhub = 1, dag = TRUE)
## If we assume that different condition has different genetics perturbations (eQTLs)
## data$Data$X = list(data$Data$X, data$Data$X)
gamma = cv.multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, ngamma = 20, nfold = 5,
                           N, Ng, Nk)
fit   = multiRegression(data$Data$X, data$Data$Y, data$Data$Sk, gamma, N, Ng, Nk,
                      trans = FALSE)



