library(lfe)


### Name: fevcov
### Title: Compute limited mobility bias corrected covariance matrix
###   between fixed effects
### Aliases: fevcov

### ** Examples


x <- rnorm(5000)
x2 <- rnorm(length(x))

## create individual and firm
id <- factor(sample(40,length(x),replace=TRUE))
firm <- factor(sample(30,length(x),replace=TRUE,prob=c(2,rep(1,29))))
foo <- factor(sample(20,length(x),replace=TRUE))
## effects
id.eff <- rnorm(nlevels(id))
firm.eff <- runif(nlevels(firm))
foo.eff <- rchisq(nlevels(foo),df=1)
## left hand side
id.m <- id.eff[id]
firm.m <- firm.eff[firm]
foo.m <- foo.eff[foo]
# normalize them
id.m <- id.m/sd(id.m)
firm.m <- firm.m/sd(firm.m)
foo.m <- foo.m/sd(foo.m)
y <- x + 0.25*x2 + id.m + firm.m + foo.m + rnorm(length(x),sd=2)
z <- x + 0.5*x2 + 0.7*id.m + 0.5*firm.m + 0.3*foo.m + rnorm(length(x),sd=2)
# make a data frame
fr <- data.frame(y,z,x,x2,id,firm,foo)
## estimate and print result
est <- felm(y|z ~ x+x2|id+firm+foo, data=fr, keepX=TRUE)
# find bias corrections, there's little bias in this example
print(yv <- fevcov(est, lhs='y'))
## Here's how to compute the unbiased correlation matrix:
cm <- cov2cor(yv)
structure(cm,bias=NULL)




