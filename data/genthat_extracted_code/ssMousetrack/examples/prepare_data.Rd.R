library(ssMousetrack)


### Name: prepare_data
### Title: Prepare mouse-tracking trajectories for state-space modeling via
###   Stan
### Aliases: prepare_data

### ** Examples


data(congruency)
dataout <- prepare_data(X = congruency,preprocess = TRUE,Z.formula = "~congruency*plausibility")
str(dataout)




