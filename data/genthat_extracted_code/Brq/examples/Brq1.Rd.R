library(Brq)


### Name: Bqr
### Title: Bayesian Quantile Regression
### Aliases: Bqr Brq Brq.default Brq.formula

### ** Examples

# Example 1
n <- 100
x <- runif(n=n,min=0,max=5)
y <- 1 + 1.5*x + .5*x*rnorm(n)
Brq(y~x,tau=0.5,runs=2000, burn=500)
Brq(y~x,tau=0.95,runs=2000, burn=500)


# Example 2
n <- 100
x <- runif(n=n,min=0,max=5)
y <- 1 + 1.5*x+ .5*x*rnorm(n)
plot(x,y, main="Scatterplot and Quantile Regression Fit", xlab="x", cex=.5, col="gray")
for (i in 1:5) {
if (i==1) p = .05
if (i==2) p = .25
if (i==3) p = .50
if (i==4) p = .75
if (i==5) p = .95
fit = Brq(y~x,tau=p,runs=1500, burn=500)
# Note: runs =11000 and burn =1000
abline(a=mean(fit$coef[1]),b=mean(fit$coef[2]),lty=i,col=i)
}
abline( lm(y~x),lty=1,lwd=2,col=6)
legend(x=-0.30,y=max(y)+0.5,legend=c(.05,.25,.50,.75,.95,"OLS"),lty=c(1,2,3,4,5,1),
lwd=c(1,1,1,1,1,2),col=c(1:6),title="Quantile")





