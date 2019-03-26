library(DescTools)


### Name: BrierScore
### Title: Brier Score for Assessing Prediction Accuracy
### Aliases: BrierScore BrierScore.glm BrierScore.default
### Keywords: models

### ** Examples

r.glm <- glm(Survived ~ ., data=Untable(Titanic), family=binomial)

BrierScore(r.glm)



