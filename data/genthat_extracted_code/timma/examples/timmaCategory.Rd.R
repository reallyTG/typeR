library(timma)


### Name: timmaCategory
### Title: Predicting drug sensitivity with multi-class drug-target
###   interaction data using one.sided TIMMA model
### Aliases: timmaCategory

### ** Examples

data(tyner_interaction_multiclass)
data(tyner_sensitivity)
results<-timmaCategory(tyner_interaction_multiclass[, 1:6], tyner_sensitivity[,1], class = 6)



