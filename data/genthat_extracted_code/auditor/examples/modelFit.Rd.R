library(auditor)


### Name: modelFit
### Title: Create Model Fit explainer
### Aliases: modelFit

### ** Examples

library(MASS)
model.glm <- glm(Postwt ~ Prewt + Treat + offset(Prewt), family = gaussian, data = anorexia)
audit.glm <- audit(model.glm)

mf.glm <- modelFit(audit.glm)




