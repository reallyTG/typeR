library(mmeln)


### Name: estim
### Title: Maximum Likelihood estimation of the model parameters
### Aliases: estim estim.mmeln estimmmelnCS1 estimmmelnIND1 I.CS1 I.IND1
###   IE.CS1 IE.IND1 Xinv covNA.wt estimloc.disp.CS1 estimloc.disp.IND1
###   logit pfQ.intermediate.CS1
### Keywords: mmeln mixture normal multivariate

### ** Examples

data(exY)
### estimation of the parameters of the mixture
temps=0:2
mmeln1=mmeln(Y, G = 3, form.loc = list(~temps, ~temps + I(temps^2),
                       ~temps + I(temps^2)), form.mel = ~SEXE, cov = "CS")
mmelnSOL1=estim(mmeln1,mu = list(c(1,1), c(2,0,0), c(3,0,0)),
    tau = c(0,0,0,0), sigma = list(c(1,0), c(1,0), c(1,0)))



