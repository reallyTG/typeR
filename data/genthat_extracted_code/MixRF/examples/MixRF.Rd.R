library(MixRF)


### Name: MixRF
### Title: Mixed Random Forest
### Aliases: MixRF

### ** Examples


data(sleepstudy)

tmp = MixRF(Y = sleepstudy$Reaction, X = as.data.frame(sleepstudy$Days), 
    random = "(Days|Subject)", data = sleepstudy, initialRandomEffects = 0, 
    ErrorTolerance = 0.01, MaxIterations = 100)

# tmp$forest

# tmp$MixedModel

# tmp$RandomEffects



