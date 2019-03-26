library(mplot)


### Name: mplot
### Title: Model selection and stability curves
### Aliases: mplot

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
dat = round(data.frame(y,x1,x2,x3,x4,x5),2)
lm1 = lm(y ~ ., data = dat)
## Not run: 
##D v1 = vis(lm1, cores = 3)
##D af1 = af(lm1, cores = 3)
##D mplot(lm1, v1, af1)
## End(Not run)




