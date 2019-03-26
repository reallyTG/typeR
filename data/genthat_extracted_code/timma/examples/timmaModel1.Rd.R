library(timma)


### Name: timmaModel1
### Title: Predicting drug sensitivity with binary drug-target interaction
###   data using two.sided TIMMA model
### Aliases: timmaModel1

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
results<-timmaModel1(tyner_interaction_binary[, 1:6], tyner_sensitivity[,1])



