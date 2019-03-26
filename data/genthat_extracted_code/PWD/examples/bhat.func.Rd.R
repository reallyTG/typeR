library(PWD)


### Name: bhat.func
### Title: Compute PWD Regression Coefficients Given alpha
### Aliases: bhat.func

### ** Examples

set.seed(12)
N=80
err = rnorm(N)
X = 1:N
slopes = c(rep(1.5,40),rep(2,N-40))
y = rep(5,N) + slopes*X + err                  
alpha1 = 1.0
coeffs1 = bhat.func(y,X,alpha1)
alpha2 = .9
coeffs2 = bhat.func(y,X,alpha2)
plot(x=X,y=y)
abline(a=coeffs2[1],b=coeffs2[2],lty=2,col="red")
abline(a=coeffs1[1],b=coeffs1[2],lty=2)
legend("right", legend=c("OLS","PWD"), col=c(1,2), lty=c(2,2), lwd=c(1,1))



