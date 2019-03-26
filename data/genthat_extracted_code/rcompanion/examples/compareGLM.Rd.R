library(rcompanion)


### Name: compareGLM
### Title: Compare fit statistics for glm models
### Aliases: compareGLM

### ** Examples

### Compare among logistic regresion models
data(AndersonBias)
model.0 = glm(Result ~ 1, weight = Count, data = AndersonBias,
             family = binomial(link="logit"))
model.1 = glm(Result ~ County, weight = Count, data = AndersonBias,
             family = binomial(link="logit"))
model.2 = glm(Result ~ County + Sex, weight = Count, data = AndersonBias,
             family = binomial(link="logit"))
model.3 = glm(Result ~ County + Sex + County:Sex, weight = Count, 
             data = AndersonBias, family = binomial(link="logit"))
compareGLM(model.0, model.1, model.2, model.3)              




