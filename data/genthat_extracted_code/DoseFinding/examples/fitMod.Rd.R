library(DoseFinding)


### Name: fitMod
### Title: Fit non-linear dose-response model
### Aliases: fitMod coef.DRMod vcov.DRMod predict.DRMod plot.DRMod
###   logLik.DRMod AIC.DRMod gAIC gAIC.DRMod

### ** Examples

## Fit the emax model to the IBScovars data set
data(IBScovars)
fitemax <- fitMod(dose, resp, data=IBScovars, model="emax",
                  bnds = c(0.01, 4))

## methods for DRMod objects
summary(fitemax)
## extracting coefficients
coef(fitemax)
## (asymptotic) covariance matrix of estimates
vcov(fitemax)
## predicting
newdat <- data.frame(dose = c(0,0.5,1), gender=factor(1))
predict(fitemax, newdata=newdat, predType = "full-model", se.fit = TRUE)
## plotting 
plot(fitemax, plotData = "meansCI", CI=TRUE)

## now include (additive) covariate gender
fitemax2 <- fitMod(dose, resp, data=IBScovars, model="emax",
                   addCovars = ~gender, bnds = c(0.01, 4))
vcov(fitemax2)
plot(fitemax2)
## fitted log-likelihood
logLik(fitemax2)
## extracting AIC (or BIC)
AIC(fitemax2)

## Illustrating the "general" approach for a binary regression
## produce first stage fit (using dose as factor)
data(migraine)
PFrate <- migraine$painfree/migraine$ntrt
doseVec <- migraine$dose
doseVecFac <- as.factor(migraine$dose)
## fit logistic regression with dose as factor
fitBin <- glm(PFrate~doseVecFac-1, family = binomial,
              weights = migraine$ntrt)
drEst <- coef(fitBin)
vCov <- vcov(fitBin)
## now fit an Emax model (on logit scale)
gfit <- fitMod(doseVec, drEst, S=vCov, model = "emax", bnds = c(0,100),
                type = "general")
## model fit on logit scale
plot(gfit, plotData = "meansCI", CI = TRUE)
## model on probability scale
logitPred <- predict(gfit, predType ="ls-means", doseSeq = 0:200,
                     se.fit=TRUE)
plot(0:200, 1/(1+exp(-logitPred$fit)), type = "l", ylim = c(0, 0.5),
     ylab = "Probability of being painfree", xlab = "Dose")
LB <- logitPred$fit-qnorm(0.975)*logitPred$se.fit
UB <- logitPred$fit+qnorm(0.975)*logitPred$se.fit
lines(0:200, 1/(1+exp(-LB)))
lines(0:200, 1/(1+exp(-UB)))


## now illustrate "general" approach for placebo-adjusted data (on
## IBScovars) note that the estimates are identical to fitemax2 above)
anovaMod <- lm(resp~factor(dose)+gender, data=IBScovars)
drFit <- coef(anovaMod)[2:5] # placebo adjusted estimates at doses
vCov <- vcov(anovaMod)[2:5,2:5]
dose <- sort(unique(IBScovars$dose))[-1]
## now fit an emax model to these estimates
gfit2 <- fitMod(dose, drFit, S=vCov, model = "emax", type = "general",
               placAdj = TRUE, bnds = c(0.01, 2))
## some outputs
summary(gfit2)
coef(gfit2)
vcov(gfit2)
predict(gfit2, se.fit = TRUE, doseSeq = c(1,2,3,4), predType = "effect-curve")
plot(gfit2, CI=TRUE, plotData = "meansCI")
gAIC(gfit2)



