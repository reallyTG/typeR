library(lfe)


### Name: varvars
### Title: Compute the variance of the fixed effect variance estimate
### Aliases: varvars

### ** Examples


x <- rnorm(500)
x2 <- rnorm(length(x))

## create individual and firm
id <- factor(sample(40,length(x),replace=TRUE))
firm <- factor(sample(30,length(x),replace=TRUE,prob=c(2,rep(1,29))))
foo <- factor(sample(20,length(x),replace=TRUE))
## effects
id.eff <- rnorm(nlevels(id))
firm.eff <- rnorm(nlevels(firm))
foo.eff <- rnorm(nlevels(foo))
## left hand side
id.m <- id.eff[id]
firm.m <- 2*firm.eff[firm]
foo.m <- 3*foo.eff[foo]
y <- x + 0.25*x2 + id.m + firm.m + foo.m + rnorm(length(x))

# make a data frame
fr <- data.frame(y,x,x2,id,firm,foo)
## estimate and print result
est <- felm(y ~ x+x2|id+firm+foo, data=fr, keepX=TRUE)
alpha <- getfe(est)
# estimate the covariance matrix of the fixed effects
fevcov(est, alpha)
# estimate variances of the diagonal
varvars(est, alpha)




