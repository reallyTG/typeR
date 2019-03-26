library(auditor)


### Name: modelResiduals
### Title: Create Model Residuals explainer
### Aliases: modelResiduals

### ** Examples

library(MASS)
model.glm <- glm(Postwt ~ Prewt + Treat + offset(Prewt), family = gaussian, data = anorexia)
audit.glm <- audit(model.glm)

mr.glm <- modelResiduals(audit.glm)




