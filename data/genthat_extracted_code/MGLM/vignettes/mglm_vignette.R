## ----warning=FALSE, message=FALSE----------------------------------------
library(MGLM)
set.seed(123)
n <- 200
d <- 4
alpha <- rep(1, d)
m <- 50
Y <- rmn(n, m, alpha)

## ------------------------------------------------------------------------
mnFit <- MGLMfit(Y, dist="MN")
show(mnFit)

## ------------------------------------------------------------------------
compareFit <- MGLMfit(Y, dist="DM")
show(compareFit)

## ----warning=FALSE-------------------------------------------------------
set.seed(123)
n <- 200
d <- 4
alpha <- rep(1, d)
m <- 50
Y <- rdirmn(n, m, alpha)

## ------------------------------------------------------------------------
dmFit <- MGLMfit(Y, dist="DM")
show(dmFit)

## ------------------------------------------------------------------------
gdmFit <- MGLMfit(Y, dist="GDM")
show(gdmFit)

## ----warning=FALSE-------------------------------------------------------
set.seed(124)
n <- 200
d <- 4
alpha <- rep(1, d-1)
beta <- rep(1, d-1)
m <- 50
Y <- rgdirmn(n, m, alpha, beta)
gdmFit <- MGLMfit(Y, dist="GDM")
gdmFit

## ------------------------------------------------------------------------
set.seed(1220)
n <- 100
d <- 4
p <- 5
prob <- rep(0.2, d)
beta <- 10
Y <- rnegmn(n, beta, prob)
negmnFit <- MGLMfit(Y, dist="NegMN")
show(negmnFit)

## ------------------------------------------------------------------------
set.seed(1234)
n <- 200
p <- 5
d <- 4
X <- matrix(runif(p * n), n, p)
alpha <- matrix(c(0.6, 0.8, 1), p, d - 1, byrow=TRUE)
alpha[c(1, 2),] <- 0
Alpha <- exp(X %*% alpha)
beta <- matrix(c(1.2, 1, 0.6), p, d - 1, byrow=TRUE)
beta[c(1, 2),] <- 0
Beta <- exp(X %*% beta)
m <- runif(n, min=0, max=25) + 25
Y <- rgdirmn(n, m, Alpha, Beta)

## ----warning=FALSE-------------------------------------------------------
mnReg <- MGLMreg(Y~0+X, dist="MN")
show(mnReg)

## ----warning=FALSE-------------------------------------------------------
dmReg <- MGLMreg(Y~0+X, dist="DM")
show(dmReg)

## ----warning=FALSE-------------------------------------------------------
gdmReg <- MGLMreg(Y~0+X, dist="GDM")
show(gdmReg)

## ----warning=FALSE-------------------------------------------------------
negReg <- MGLMreg(Y~0+X, dist="NegMN", regBeta=FALSE)
show(negReg)

## ------------------------------------------------------------------------
newX <- matrix(runif(1*p), 1, p)
pred <- predict(gdmReg, newX)
pred

## ------------------------------------------------------------------------
set.seed(118)
n <- 100
p <- 10
d <- 5
m <- rbinom(n, 200, 0.8)
X <- matrix(rnorm(n * p), n, p)
alpha <- matrix(0, p, d)
alpha[c(1, 3, 5), ] <- 1
Alpha <- exp(X %*% alpha)
Y <- rdirmn(size=m, alpha=Alpha)

## ----warning=FALSE-------------------------------------------------------
sweep <- MGLMtune(Y ~ 0 + X, dist="DM", penalty="sweep", ngridpt=30)
show(sweep)

## ----warning=FALSE-------------------------------------------------------
group <- MGLMtune(Y ~ 0 + X, dist="DM", penalty="group", ngridpt=30)
show(group)

## ----warning=FALSE-------------------------------------------------------
nuclear <- MGLMtune(Y ~ 0 + X, dist="DM", penalty="nuclear", ngridpt=30, warm.start=FALSE)
show(nuclear)

