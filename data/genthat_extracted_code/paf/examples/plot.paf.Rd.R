library(paf)


### Name: plot.paf
### Title: Plot method for 'paf' objects
### Aliases: plot.paf
### Keywords: survival

### ** Examples

# simulated data set from a Cox model
n = 1000
x1 = as.numeric(runif(n)>0.5)
x2 = x1 + rnorm(n)
t = exp(-x1 - 0.5 * x2) * rexp(n, rate = 0.1)
c = runif(n, 0, 3.4)
y = pmin(t, c)
delta = as.numeric(t<=c)
test = data.frame(time=y, status=delta, x1=x1, x2=x2)

# calculate the atrributable fraction function of x1 adjusting for x2
result=paf(Surv(time, status) ~ x1 + x2, data=test, cov=c('x1'))
# plot the attributable fraction function
plot(result)




