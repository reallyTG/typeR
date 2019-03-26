library(partialOR)


### Name: fitOR
### Title: FITTING H- and F-MODELS
### Aliases: fitOR

### ** Examples

## simulate example data 
dd <- simData(50,2,1.5,123) 
## fit the models
ff <- fitOR(dd) 
## display parameter estimates of the H-model
ff$fitH$coefficients



