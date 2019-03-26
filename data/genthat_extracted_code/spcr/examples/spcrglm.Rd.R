library(spcr)


### Name: spcrglm
### Title: Fit a sparse principal component regression for generalized
###   linear models (SPCR-glm)
### Aliases: spcrglm
### Keywords: models regression

### ** Examples

# binomial
n <- 100
np <- 5
nu0 <- c(-1, 1)
set.seed(4)
x <- matrix( rnorm(np*n), n, np )
y <- rbinom(n,1,1-1/(1+exp(  (nu0[1]*x[ ,1] + nu0[2]*x[ ,2]  ))))
spcrglm.fit <- spcrglm(x=x, y=y, k=2, family="binomial", lambda.B=2, lambda.gamma=1)
spcrglm.fit

# Poisson
set.seed(4)
y <- rpois(n, exp(  (nu0[1]*x[ ,1] + nu0[2]*x[ ,2] ) ))
spcrglm.fit <- spcrglm(x=x, y=y, k=2, family="poisson", lambda.B=2, lambda.gamma=1)
spcrglm.fit

# multinomial
set.seed(4)
y <- sample(1:4, n, replace=TRUE)
spcrglm.fit <- spcrglm(x=x, y=y, k=2, family="multinomial", lambda.B=2, lambda.gamma=2)
spcrglm.fit



