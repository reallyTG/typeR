library(mplot)


### Name: bglmnet
### Title: Model stability and variable importance plots for glmnet
### Aliases: bglmnet

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
dat = data.frame(y, x1, x2, x3, x4, x5)
lm1 = lm(y ~ ., data = dat)
## Don't show: 
bg1 = bglmnet(lm1, seed = 1, B=10)
plot(bg1)
## End(Don't show)
## Not run: 
##D bg1 = bglmnet(lm1, seed = 1)
##D # plot(bg1, which = "boot_size", interactive = TRUE)
##D plot(bg1, which = "boot_size", interactive = FALSE)
##D # plot(bg1, which = "vip", interactive = TRUE)
##D plot(bg1, which = "vip", interactive = FALSE)
## End(Not run)



