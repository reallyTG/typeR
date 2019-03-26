library(mplot)


### Name: af
### Title: The adaptive fence procedure
### Aliases: af

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
lm1 = lm(y ~ ., data = dat)
## Don't show: 
af1 = af(lm1, cores = 1, B = 5, n.c = 5, seed = 1)
summary(af1)
plot(af1)
## End(Don't show)
## Not run: 
##D af1 = af(lm1, initial.stepwise = TRUE, seed = 1)
##D summary(af1)
##D plot(af1)
## End(Not run)



