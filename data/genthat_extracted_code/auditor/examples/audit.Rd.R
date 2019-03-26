library(auditor)


### Name: audit
### Title: Create modelAudit object
### Aliases: audit

### ** Examples

library(MASS)
model.glm <- glm(Postwt ~ Prewt + Treat + offset(Prewt), family = gaussian, data = anorexia)
audit.glm <- audit(model.glm)

p.fun <- function(model, data){predict(model, data, response = "link")}
audit.glm.newpred <- audit(model.glm, predict.function = p.fun)


library(randomForest)
model.rf <- randomForest(Species ~ ., data=iris)
audit.rf <- audit(model.rf)




