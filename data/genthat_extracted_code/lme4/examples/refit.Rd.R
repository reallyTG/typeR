library(lme4)


### Name: refit
### Title: Refit a (merMod) Model with a Different Response
### Aliases: refit refit.merMod

### ** Examples

## Ex. 1: using refit() to fit each column in a matrix of responses -------
set.seed(101)
Y <- matrix(rnorm(1000),ncol=10)
## combine first column of responses with predictor variables
d <- data.frame(y=Y[,1],x=rnorm(100),f=rep(1:10,10))
## (use check.conv.grad="ignore" to disable convergence checks because we
##  are using a fake example)
## fit first response
fit1 <- lmer(y ~ x+(1|f), data = d,
             control= lmerControl(check.conv.grad="ignore",
                                  check.conv.hess="ignore"))
## combine fit to first response with fits to remaining responses
res <- c(fit1,lapply(as.data.frame(Y[,-1]), refit, object=fit1))

## Ex. 2: refitting simulated data using data that contain NA values ------
sleepstudyNA <- sleepstudy
sleepstudyNA$Reaction[1:3] <- NA
fm0 <- lmer(Reaction ~ Days + (1|Subject), sleepstudyNA)
## the special case of refitting with a single simulation works ...
ss0 <- refit(fm0, simulate(fm0))
## ... but if simulating multiple responses (for efficiency),
## need to use na.action=na.exclude in order to have proper length of data
fm1 <- lmer(Reaction ~ Days + (1|Subject), sleepstudyNA, na.action=na.exclude)
ss <- simulate(fm1, 5)
res2 <- refit(fm1, ss[[5]])



