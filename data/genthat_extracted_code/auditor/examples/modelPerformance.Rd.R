library(auditor)


### Name: modelPerformance
### Title: Create Model Performance Explainer
### Aliases: modelPerformance

### ** Examples

library(MASS)
model.glm <- glm(Postwt ~ Prewt + Treat + offset(Prewt), family = gaussian, data = anorexia)
audit.glm <- audit(model.glm)

mp.glm <- modelPerformance(audit.glm)





