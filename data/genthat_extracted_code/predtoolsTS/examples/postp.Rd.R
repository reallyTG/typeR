library(predtoolsTS)


### Name: postp
### Title: Post-processing of pre-processed data
### Aliases: postp

### ** Examples

preprocess <- prep(AirPassengers)
prediction <- pred(modl(preprocess),n.ahead=30)
postp.prediction <- postp(prediction,preprocess)



