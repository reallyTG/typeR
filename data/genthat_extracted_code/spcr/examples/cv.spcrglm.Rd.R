library(spcr)


### Name: cv.spcrglm
### Title: Cross-validation for spcr-glm
### Aliases: cv.spcrglm
### Keywords: models regression

### ** Examples

# binomial
n <- 100
np <- 3
nu0 <- c(-1, 1)
set.seed(4)
x <- matrix( rnorm(np*n), n, np )
y <- rbinom(n,1,1-1/(1+exp(  (nu0[1]*x[ ,1] + nu0[2]*x[ ,2]  ))))
cv.spcrglm.fit <- cv.spcrglm(x=x, y=y, k=1, family="binomial")
cv.spcrglm.fit

# Poisson
set.seed(5)
y <- rpois(n, 1)
cv.spcrglm.fit <- cv.spcrglm(x=x, y=y, k=1, family="poisson")
cv.spcrglm.fit

# multinomial
set.seed(4)
y <- sample(1:4, n, replace=TRUE)
cv.spcrglm.fit <- cv.spcrglm(x=x, y=y, k=1, family="multinomial")
cv.spcrglm.fit



