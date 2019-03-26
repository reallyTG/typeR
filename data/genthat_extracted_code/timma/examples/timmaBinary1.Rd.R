library(timma)


### Name: timmaBinary1
### Title: Predicting drug sensitivity with binary drug-target interaction
###   data using modified maximization and minimization rules
### Aliases: timmaBinary1

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
results<-timmaBinary1(tyner_interaction_binary[, 1:6], tyner_sensitivity[,1])



