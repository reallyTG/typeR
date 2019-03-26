library(lava)


### Name: mixture
### Title: Estimate mixture latent variable model.
### Aliases: mixture
### Keywords: models, regression

### ** Examples


## No test: 
m0 <- lvm(list(y~x+z,x~z))
distribution(m0,~z) <- binomial.lvm()
d <- sim(m0,2000,p=c("y~z"=2,"y~x"=1),seed=1)

## unmeasured confounder example
m <- baptize(lvm(y~x, x~1));
intercept(m,~x+y) <- NA

set.seed(42)
M <- mixture(m,k=2,data=d,control=list(trace=1,tol=1e-6))
summary(M)
lm(y~x,d)
estimate(M,"y~x")
## True slope := 1
## End(No test)




