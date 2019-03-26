library(JM)


### Name: survfitJM
### Title: Prediction in Joint Models
### Aliases: survfitJM survfitJM.jointModel
### Keywords: methods

### ** Examples

# linear mixed model fit
fitLME <- lme(sqrt(CD4) ~ obstime + obstime:drug, 
    random = ~ 1 | patient, data = aids)
# cox model fit
fitCOX <- coxph(Surv(Time, death) ~ drug, data = aids.id, x = TRUE)

# joint model fit
fitJOINT <- jointModel(fitLME, fitCOX, 
    timeVar = "obstime", method = "weibull-PH-aGH")

# sample of the patients who are still alive
ND <- aids[aids$patient == "141", ]
ss <- survfitJM(fitJOINT, newdata = ND, idVar = "patient", M = 50)
ss



