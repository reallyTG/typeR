library(RRreg)


### Name: RRlin
### Title: Linear randomized response regression
### Aliases: RRlin

### ** Examples

# generate two RR predictors
dat <- RRgen(n=500, pi=.4, model="Warner", p=.3)
dat2 <- RRgen(n=500, pi=c(.4,.6), model="FR", p=c(.1,.15))
dat$FR <- dat2$response
dat$trueFR <- dat2$true

# generate a third predictor and continuous dependent variables
dat$nonRR <- rnorm(500, 5, 1)
dat$depvar <- 2*dat$true - 3*dat2$true + 
                       .5*dat$nonRR +rnorm(500, 1, 7) 

# use RRlin and compare to regression on non-RR variables
linreg <- RRlin(depvar~response+FR+nonRR, data=dat,
                models=c("Warner","FR"),
                p.list=list(.3, c(.1,.15)), fit.n=1)
summary(linreg)
summary(lm(depvar~true +trueFR+nonRR, data=dat))



