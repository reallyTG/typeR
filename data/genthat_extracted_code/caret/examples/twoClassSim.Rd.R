library(caret)


### Name: SLC14_1
### Title: Simulation Functions
### Aliases: SLC14_1 SLC14_2 LPH07_1 LPH07_2 twoClassSim
### Keywords: models

### ** Examples


example <- twoClassSim(100, linearVars = 1)
splom(~example[, 1:6], groups = example$Class)




