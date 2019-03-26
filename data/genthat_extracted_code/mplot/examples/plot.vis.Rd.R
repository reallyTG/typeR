library(mplot)


### Name: plot.vis
### Title: Plot diagnostics for a vis object
### Aliases: plot.vis

### ** Examples

n = 100
set.seed(11)
e = rnorm(n)
x1 = rnorm(n)
x2 = rnorm(n)
x3 = x1^2
x4 = x2^2
x5 = x1*x2
y = 1 + x1 + x2 + e
dat = data.frame(y,x1,x2,x3,x4,x5)
lm1 = lm(y~.,data=dat)
## Don't show: 
v1 = vis(lm1, B = 5, cores = 1, seed = 1)
plot(v1, highlight = "x1", which = "lvk")
plot(v1, which = "boot")
plot(v1, which = "vip")
## End(Don't show)
## Not run: 
##D v1 = vis(lm1, seed = 1)
##D plot(v1, highlight = "x1", which = "lvk")
##D plot(v1, which = "boot")
##D plot(v1, which = "vip")
## End(Not run)



