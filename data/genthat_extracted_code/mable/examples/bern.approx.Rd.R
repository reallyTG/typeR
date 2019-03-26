library(mable)


### Name: bern.approx
### Title: Bernstein Polynomial Approximation
### Aliases: bern.approx
### Keywords: ~distribution ~models ~nonparametric ~smooth

### ** Examples

## No test: 
# classical Bernstein polynomial
a<--4; b<-4; m<-200
x<-seq(a,b,len=512)
u<-(0:m)/m
p<-dnorm(a+(b-a)*u)
plot(x, dnorm(x), type="l")
lines(x, (b-a)*bern.approx(x, p, a, b)/(m+1), lty=2, col=2)
legend(a, dnorm(0), lty=1:2, col=1:2, c(expression(f(x)==phi(x)),
                expression(B^{f}*(x))))
## End(No test)



