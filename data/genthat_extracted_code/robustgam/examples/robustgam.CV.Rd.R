library(robustgam)


### Name: robustgam.CV
### Title: Smoothing parameter selection by robust cross validation
### Aliases: robustgam.CV

### ** Examples

# load library
library(robustgam)

# test function
test.fun <- function(x, ...) {
  return(2*sin(2*pi*(1-x)^2))
}

# some setting
set.seed(1234)
true.family <- poisson()
out.prop <- 0.05
n <- 100

# generating dataset for poisson case
x <- runif(n)
x <- x[order(x)]
true.eta <- test.fun(x)
true.mu <- true.family$linkinv(test.fun(x))
y <- rpois(n, true.mu) # for poisson case

# create outlier for poisson case
out.n <- trunc(n*out.prop)
out.list <- sample(1:n, out.n, replace=FALSE)
y[out.list] <- round(y[out.list]*runif(out.n,min=3,max=5)^(sample(c(-1,1),out.n,TRUE)))

## Not run: 
##D 
##D # robust GAM fit
##D robustfit.gic <- robustgam.CV(x, y, family=true.family, p=3, c=1.6, show.msg=FALSE,
##D   count.lim=400, smooth.basis='tp',ngroup=5); robustfit <- robustfit.gic$optim.fit
##D 
##D 
##D # ordinary GAM fit
##D nonrobustfit <- gam(y~s(x, bs="tp", m=3),family=true.family) # m = p for 'tp'
##D 
##D # prediction
##D x.new <- seq(range(x)[1], range(x)[2], len=1000)
##D robustfit.new <- pred.robustgam(robustfit, data.frame(X=x.new))$predict.values
##D nonrobustfit.new <- as.vector(predict.gam(nonrobustfit,data.frame(x=x.new),type="response"))
##D 
##D # plot
##D plot(x, y)
##D lines(x.new, true.family$linkinv(test.fun(x.new)), col="blue")
##D lines(x.new, robustfit.new, col="red")
##D lines(x.new, nonrobustfit.new, col="green")
##D legend(0.6, 23, c("true mu", "robust fit", "nonrobust fit"), col=c("blue","red","green"),
##D   lty=c(1,1,1))
##D 
## End(Not run)



