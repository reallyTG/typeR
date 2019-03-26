### R code from vignette source 'examples.Rnw'
### Encoding: UTF-8

###################################################
### code chunk number 1: pima-data
###################################################
library(MASS)
pima <- rbind(Pima.tr, Pima.te)
pima$hasDiabetes <- as.numeric(pima$type == "Yes")
pima.nObs <- nrow(pima)


###################################################
### code chunk number 2: pima-setup-and-zs
###################################################
library(glmBfp)

## define the prior distributions for g which we are going to use:
prior <- InvGammaGPrior(a=1/2, 
                        b=pima.nObs/2)
## (the warning can be ignored)


###################################################
### code chunk number 3: hyper-g/n
###################################################
## You may also use the hyper-g/n prior:
prior.f2 <- CustomGPrior(logDens=function(g) 
                         - log(pima.nObs) - 2 * log(1 + g / pima.nObs))


###################################################
### code chunk number 4: pima-search
###################################################
set.seed(102)
time.pima <-
    system.time(models.pima <-
                glmBayesMfp(type ~ 
                            bfp(npreg) + 
                            bfp(glu) + 
                            bfp(bp) +
                            bfp(skin) + 
                            bfp(bmi) + 
                            bfp(ped) + 
                            bfp(age),
                            data=pima,
                            family=binomial("logit"),
                            priorSpecs=
                            list(gPrior=prior,
                                 modelPrior="sparse"),
                            nModels=1e3L,
                            chainlength=1e1L,
                            method="sampling",
                            useOpenMP=FALSE,
                            higherOrderCorrection=TRUE))  
time.pima
attr(models.pima, "numVisited")


###################################################
### code chunk number 5: pima-top-models
###################################################
table.pima <- as.data.frame(models.pima)
table.pima


###################################################
### code chunk number 6: pima-incprobs
###################################################
round(attr(models.pima, "inclusionProbs"),2)


###################################################
### code chunk number 7: pima-sampling
###################################################
## MCMC settings
mcmcOptions <- McmcOptions(iterations=1e4L,
                           burnin=1e3L,
                           step=2L)

## get samples from the MAP model
set.seed(634)
mapSamples <- sampleGlm(models.pima[1L], 
                        mcmc=mcmcOptions,
                        useOpenMP=FALSE)


###################################################
### code chunk number 8: pima-samples-structure
###################################################
str(mapSamples)


###################################################
### code chunk number 9: pima-fitted-values
###################################################
mapFit <- rowMeans(plogis(mapSamples$samples@fitted))
head(mapFit)


###################################################
### code chunk number 10: pima-coda
###################################################
library(coda)

coefMcmc <- mcmc(data=t(mapSamples$coefficients),
                 start=mcmcOptions@burnin + 1,
                 thin=mcmcOptions@step)
str(coefMcmc)

## standard summary table for the coefficients:
summary(coefMcmc)
autocorr(coefMcmc)
## etc.

plot(coefMcmc) 


###################################################
### code chunk number 11: pima-coda-2
###################################################
## samples of z:
zMcmc <- mcmc(data=mapSamples$samples@z,
              start=mcmcOptions@burnin + 1,
              thin=mcmcOptions@step)
plot(zMcmc)
## etc.


###################################################
### code chunk number 12: pima-plot-ex
###################################################
plotCurveEstimate(termName="skin",
                  samples=mapSamples$samples)


###################################################
### code chunk number 13: pima-model-averaging
###################################################
set.seed(312)
bmaSamples <- 
    sampleBma(models.pima[1:3],
              mcmc=mcmcOptions,
              useOpenMP=FALSE,
              nMargLikSamples=1000)

## look at the list element names:
names(bmaSamples)

## now we can see how close the MCMC estimates ("margLikEstimate")
## are to the ILA estimates ("logMargLik") of the log marginal likelihood:
bmaSamples$modelData[, c("logMargLik", "margLikEstimate")]

## the "samples" list is again of class "GlmBayesMfpSamples":
class(bmaSamples$samples)


