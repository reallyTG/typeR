library(ACSWR)


### Name: tensile
### Title: The Tensile Strength Experiment
### Aliases: tensile
### Keywords: completely randomized design

### ** Examples

data(tensile)
tensile$CWP <- as.factor(tensile$CWP)
tensile_aov <- aov(Tensile_Strength~CWP, data=tensile)
summary(tensile_aov)
model.matrix(tensile_aov)



