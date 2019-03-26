library(ADMMsigma)


### Name: plot.RIDGE
### Title: Plot RIDGE object
### Aliases: plot.RIDGE

### ** Examples

# generate data from a sparse matrix
# first compute covariance matrix
S = matrix(0.7, nrow = 5, ncol = 5)
for (i in 1:5){
 for (j in 1:5){
   S[i, j] = S[i, j]^abs(i - j)
 }
 }

# generate 100 x 5 matrix with rows drawn from iid N_p(0, S)
set.seed(123)
Z = matrix(rnorm(100*5), nrow = 100, ncol = 5)
out = eigen(S, symmetric = TRUE)
S.sqrt = out$vectors %*% diag(out$values^0.5)
S.sqrt = S.sqrt %*% t(out$vectors)
X = Z %*% S.sqrt

# produce CV heat map for RIDGEsigma
plot(RIDGEsigma(X, lam = 10^seq(-5, 5, 0.5)))

# produce line graph for RIDGEsigma
plot(RIDGEsigma(X), type = 'line')



