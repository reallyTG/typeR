library(lfe)


### Name: fixedse
### Title: Compute standard errors for fixed effects
### Aliases: fixedse
### Keywords: internal

### ** Examples

x <- rnorm(1000)
f <- factor(sample(5,1000,replace=TRUE))
y <- x + (1:5)[f] + rnorm(1000)
est <- felm(y ~ x | f, keepX=TRUE)
#both bootstrap and computed se:
cbind(getfe(est,ef=efactory(est,'ref'),se=TRUE), fse=fixedse(est))
#compare with lm:
summary(lm(y ~x+f-1))



