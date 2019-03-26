library(timma)


### Name: timmaModel
### Title: Predicting drug sensitivity with binary drug-target interaction
###   data
### Aliases: timmaModel

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
results<-timmaModel(tyner_interaction_binary[, 1:6], tyner_sensitivity[,1])



