library(DoseFinding)


### Name: MCPMod
### Title: MCPMod - Multiple Comparisons and Modeling
### Aliases: MCPMod predict.MCPMod plot.MCPMod

### ** Examples

data(biom)
## first define candidate model set (only need "standardized" models)
models <- Mods(linear = NULL, emax=c(0.05,0.2), linInt=c(1, 1, 1, 1),
               doses=c(0,0.05,0.2,0.6,1))
## perform MCPMod procedure
MM <- MCPMod(dose, resp, biom, models, Delta=0.5)
## a number of things can be done with an MCPMod object
MM # print method provides basic information
summary(MM) # more information
## predict all significant dose-response models
predict(MM, se.fit=TRUE, doseSeq=c(0,0.2,0.4, 0.9, 1),
        predType="ls-means")
## display all model functions 
plot(MM, plotData="meansCI", CI=TRUE)

## now perform model-averaging
MM2 <- MCPMod(dose, resp, biom, models, Delta=0.5, selModel = "aveAIC")
sq <- seq(0,1,length=11)
pred <- predict(MM, doseSeq=sq, predType="ls-means")
modWeights <- MM2$selMod
## model averaged predictions
pred <- do.call("cbind", pred)%*%modWeights
## model averaged dose-estimate
TDEst <- MM2$doseEst%*%modWeights

## now an example using a general fit and fitting based on placebo
## adjusted first-stage estimates
data(IBScovars)
## ANCOVA fit model including covariates
anovaMod <- lm(resp~factor(dose)+gender, data=IBScovars)
drFit <- coef(anovaMod)[2:5] # placebo adjusted estimates at doses
vCov <- vcov(anovaMod)[2:5,2:5]
dose <- sort(unique(IBScovars$dose))[-1] # no estimate for placebo
## candidate models
models <- Mods(emax = c(0.5, 1), betaMod=c(1,1), doses=c(0,4))
## hand over placebo-adjusted estimates drFit to MCPMod
MM3 <- MCPMod(dose, drFit, S=vCov, models = models, type = "general",
              placAdj = TRUE, Delta=0.2)
plot(MM3, plotData="meansCI")

## The first example, but with critical value handed over
## this is useful, e.g. in simulation studies
MM4 <- MCPMod(dose, resp, biom, models, Delta=0.5, critV = 2.31)



