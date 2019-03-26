library(PWD)


### Name: alphahat_LR_one_Rcpp
### Title: Estimates PWD Parameter alpha by Maximum Marginal Predictive
###   Likelihood
### Aliases: alphahat_LR_one_Rcpp

### ** Examples

set.seed(12)
N=80
err = rnorm(N)
X = 1:N
slopes = c(rep(1.5,40),rep(2,N-40))
y = rep(5,N) + slopes*X + err
init=6                
alpha.grid = seq(.75,1,length.out=40)
alphahat=alphahat_LR_one_Rcpp(y=y,X=X,alpha.grid=alpha.grid,init=init,plotting=TRUE)
alpha1 = 1.0
coeffs1 = bhat.func(y,X,alpha1)
alpha2 = alphahat
coeffs2 = bhat.func(y,X,alpha2)
plot(x=X,y=y)
abline(a=coeffs2[1],b=coeffs2[2],lty=2,col="red")
abline(a=coeffs1[1],b=coeffs1[2],lty=2)
legend("right", legend=c("OLS","PWD"), col=c(1,2), lty=c(2,2), lwd=c(1,1))



