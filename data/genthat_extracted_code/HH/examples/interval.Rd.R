library(HH)


### Name: interval
### Title: Prediction and Confidence Intervals for glm Objects
### Aliases: interval interval.glm
### Keywords: regression

### ** Examples

data(spacshu)
spacshu.bin.glm <- glm(damage ~ tempF, data=spacshu, family=binomial)

## observed data
spacshu.interval          <- interval(spacshu.bin.glm)

## new data, link
spacshu.interval.link     <- interval(spacshu.bin.glm, newdata=data.frame(tempF=30:85))

## new data, response
spacshu.interval.response <- interval(spacshu.bin.glm, newdata=data.frame(tempF=30:85),
                                      type="response")



