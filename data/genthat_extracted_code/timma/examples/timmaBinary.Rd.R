library(timma)


### Name: timmaBinary
### Title: Predicting drug sensitivity with binary drug-target interaction
###   data
### Aliases: timmaBinary

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
results<-timmaBinary(tyner_interaction_binary[, 1:6], tyner_sensitivity[,1])



