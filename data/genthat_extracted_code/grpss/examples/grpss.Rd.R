library(grpss)


### Name: grpss
### Title: Group screening and selection
### Aliases: grpss grpss.default grpss.formula

### ** Examples

library(MASS)
set.seed(23)
n <- 30 # sample size
p <- 3  # number of predictors in each group
J <- 50  # group size
group <- rep(1:J,each = 3)  # group indices
##autoregressive correlation
Sigma <- 0.6^abs(matrix(1:(p*J),p*J,p*J) - t(matrix(1:(p*J),p*J,p*J)))
X <- mvrnorm(n,seq(0,5,length.out = p*J),Sigma)
betaTrue <- runif(12,-2,5)
mu <- X%*%matrix(c(betaTrue,rep(0,p*J-12)),ncol = 1)

# normal distribution
y <- mu + rnorm(n)

# only conduct screening procedure
(gss01 <- grpss(X,y,group)) # gSIS

# perform both screening and selection procedures
## use grpss.default with cross-validation
gss11 <- grpss(X,y,group,select = TRUE,cross.validation = TRUE)
summary(gss11)
## without cross-validation
gss12 <- grpss(X,y,threshold = 10,group,select = TRUE,criterion = "gHOLP")
summary(gss12)

## binomial distribution
y1 <- rbinom(n,1,1/(1 + exp(-mu)))
(gss21 <- grpss(X,y1,group, criterion = "gAR2")) # use AIC
(gss22 <- grpss(X,y1,group, criterion = "gDC"))  # use gDC

## poisson distribution
y2 <- rpois(n,lambda = exp(mu))
(gss31 <- grpss(X,y2,group, criterion = "gAR2"))
(gss22 <- grpss(X,y2,group, criterion = "gDC"))



