library(rms)


### Name: Function
### Title: Compose an S Function to Compute X beta from a Fit
### Aliases: Function.rms Function.cph sascode perlcode
### Keywords: regression methods interface models survival math

### ** Examples

set.seed(1331)
x1 <- exp(rnorm(100))
x2 <- factor(sample(c('a','b'),100,rep=TRUE))
dd <- datadist(x1, x2)
options(datadist='dd')
y  <- log(x1)^2+log(x1)*(x2=='b')+rnorm(100)/4
f  <- ols(y ~ pol(log(x1),2)*x2)
f$coef
g  <- Function(f, digits=5)
g
sascode(g)
cat(perlcode(g), '\n')
g()
g(x1=c(2,3), x2='b')   #could omit x2 since b is default category
predict(f, expand.grid(x1=c(2,3),x2='b'))
g8 <- Function(f)   # default is 8 sig. digits
g8(x1=c(2,3), x2='b')
options(datadist=NULL)


## Not run: 
##D # Make self-contained functions for computing survival probabilities
##D # using a log-normal regression
##D f <- psm(Surv(d.time, death) ~ rcs(age,4)*sex, dist='gaussian')
##D g <- Function(f)
##D surv <- Survival(f)
##D # Compute 2 and 5-year survival estimates for 50 year old male
##D surv(c(2,5), g(age=50, sex='male'))
## End(Not run)



