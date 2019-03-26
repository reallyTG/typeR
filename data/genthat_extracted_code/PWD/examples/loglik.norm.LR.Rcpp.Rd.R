library(PWD)


### Name: loglik.norm.LR.Rcpp
### Title: Compute Marginal Predictive Loglikelihood of Data Given alpha
### Aliases: loglik.norm.LR.Rcpp

### ** Examples

N=80
err = rnorm(N)
X = 1:N
slopes = c(rep(1.5,40),rep(2,N-40))
y = rep(5,N) + slopes*X + err                  
init=4
alpha.grid = seq(.65,1,length.out=40)
i=40
loglik.norm.LR.Rcpp(y,X=X,alpha=alpha.grid[i],init=init)



