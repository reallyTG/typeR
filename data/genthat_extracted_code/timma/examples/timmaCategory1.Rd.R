library(timma)


### Name: timmaCategory1
### Title: Predicting drug sensitivity with multi-class drug-target
###   interaction data using two.sided TIMMA model
### Aliases: timmaCategory1

### ** Examples

data(tyner_interaction_multiclass)
data(tyner_sensitivity)
results<-timmaCategory1(tyner_interaction_multiclass[, 1:6], tyner_sensitivity[,1], class = 6)



