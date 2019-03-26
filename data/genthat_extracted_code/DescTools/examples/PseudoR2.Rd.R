library(DescTools)


### Name: PseudoR2
### Title: Pseudo R2 Statistics
### Aliases: PseudoR2
### Keywords: model

### ** Examples

r.glm <- glm(Survived ~ ., data=Untable(Titanic), family=binomial)
PseudoR2(r.glm)

PseudoR2(r.glm, c("McFadden", "Nagel"))



