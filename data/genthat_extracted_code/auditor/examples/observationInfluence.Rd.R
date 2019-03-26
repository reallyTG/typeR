library(auditor)


### Name: observationInfluence
### Title: Create Observation Influence Explainer
### Aliases: observationInfluence

### ** Examples

library(MASS)
model.glm <- glm(Postwt ~ Prewt + Treat + offset(Prewt), family = gaussian, data = anorexia)
audit.glm <- audit(model.glm)

oi.glm <- observationInfluence(audit.glm)




