library(vcdExtra)


### Name: Summarise
### Title: Brief Summary of Model Fit for glm and loglm Models
### Aliases: Summarise Summarise.glmlist Summarise.loglmlist
###   Summarise.default
### Keywords: models

### ** Examples

data(Mental)
indep <- glm(Freq ~ mental+ses,
                family = poisson, data = Mental)
Summarise(indep)
Cscore <- as.numeric(Mental$ses)
Rscore <- as.numeric(Mental$mental)

coleff <- glm(Freq ~ mental + ses + Rscore:ses,
                family = poisson, data = Mental)
roweff <- glm(Freq ~ mental + ses + mental:Cscore,
                family = poisson, data = Mental)
linlin <- glm(Freq ~ mental + ses + Rscore:Cscore,
                family = poisson, data = Mental)
                
# compare models
Summarise(indep, coleff, roweff, linlin)




