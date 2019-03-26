library(epiR)


### Name: epi.cpresids
### Title: Covariate pattern residuals from a logistic regression model
### Aliases: epi.cpresids
### Keywords: univar univar

### ** Examples

infert.glm <- glm(case ~ spontaneous + induced, data = infert, 
   family = binomial())
   
infert.mf <- model.frame(infert.glm)
infert.cp <- epi.cp(infert.mf[-1])

infert.obs <- as.vector(by(infert$case, as.factor(infert.cp$id), 
   FUN = sum))
infert.fit <- as.vector(by(fitted(infert.glm), as.factor(infert.cp$id), 
   FUN = min))
infert.res <- epi.cpresids(obs = infert.obs, fit = infert.fit, 
   covpattern = infert.cp)



