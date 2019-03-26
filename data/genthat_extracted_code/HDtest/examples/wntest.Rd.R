library(HDtest)


### Name: wntest
### Title: Testing for multivariate or high dimensional white noise
### Aliases: wntest

### ** Examples

library(expm)
p = 15
n = 300
S1 = diag(1, p, p)
for(ii in c(1:p)){
for(jj in c(1:p)){
S1[ii, jj] = 0.995^(abs(ii-jj))
}
}
S11 = sqrtm(S1)
X = S11 %*% matrix(rt(n*p, df = 8), ncol = n)
k_max = 10
kk = seq(2, k_max, 2)
M = 500
k0 = 10
delta = 1.5
alpha = 0.05
wntest(X, M, k_max, kk, type = 1, opt = 0)
## Not run: 
##D wntest(X, M, k_max, kk, type = 1, opt = 4, cv_opt = 1)
## End(Not run)



