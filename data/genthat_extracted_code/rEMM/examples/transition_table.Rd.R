library(rEMM)


### Name: transition_table
### Title: Extract a Transition Table for a New Sequence Given an EMM
### Aliases: transition_table transition_table,EMM,numeric-method
###   transition_table,EMM,data.frame-method
###   transition_table,EMM,matrix-method
### Keywords: models

### ** Examples

data("EMMsim")

emm <- EMM(threshold=.5)
emm <- build(emm, EMMsim_train)

head(transition_table(emm, EMMsim_test))
head(transition_table(emm, EMMsim_test, type ="prob", initial_transition=TRUE))



