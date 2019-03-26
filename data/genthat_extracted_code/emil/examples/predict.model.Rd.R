library(emil)


### Name: predict.model
### Title: Predict the response of unknown observations
### Aliases: predict.model

### ** Examples

mod <- fit("lda", x=iris[-5], y=iris$Species)
prediction <- predict(mod, iris[-5])



