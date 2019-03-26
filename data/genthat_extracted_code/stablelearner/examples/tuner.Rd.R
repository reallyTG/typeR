library(stablelearner)


### Name: tuner
### Title: Tuning Wrapper Function
### Aliases: tuner
### Keywords: resampling, similarity

### ** Examples


## No test: 

library("partykit")

## tuning cforest using different values of its tuning parameter mtry
r <- tuner("cforest", tunerange = list(mtry = 1:4), formula = Species ~ ., data = iris)
stability(r, control = stab_control(seed = 1234))

## receive information about the range of tuning parameters
attr(r, "range")

## End(No test)




