library(robustgam)


### Name: cplot.robustgam
### Title: Plot of Component Smooth Functions from robustgam fit
### Aliases: cplot.robustgam

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

# robust GAM fit
robustfit <- robustgam(x, y, family=true.family, p=3, c=1.6, sp=0.000143514, show.msg=FALSE,
 smooth.basis='tp')
## the smoothing parameter is selected by the RBIC, the command is:
# robustfit.gic <- robustgam.GIC.optim(x, y, family=true.family, p=3, c=1.6, show.msg=FALSE,
#   count.lim=400, smooth.basis='tp', lsp.initial=log(1e-2) ,lsp.min=-15, lsp.max=10,
#   gic.constant=log(n), method="L-BFGS-B"); robustfit <- robustfit.gic$optim.fit


# ordinary GAM fit
nonrobustfit <- gam(y~s(x, bs="tp", m=3),family=true.family) # m = p for 'tp'

# prediction
x.new <- seq(range(x)[1], range(x)[2], len=1000)
robustfit.new <- pred.robustgam(robustfit, data.frame(X=x.new))$predict.values
nonrobustfit.new <- as.vector(predict.gam(nonrobustfit,data.frame(x=x.new),type="response"))

# plot
plot(x, y)
lines(x.new, true.family$linkinv(test.fun(x.new)), col="blue")
lines(x.new, robustfit.new, col="red")
lines(x.new, nonrobustfit.new, col="green")
legend(0.6, 23, c("true mu", "robust fit", "nonrobust fit"), col=c("blue","red","green"),
  lty=c(1,1,1))

# plot component smooth function
cplot.robustgam(robustfit, ranges=range(x))



