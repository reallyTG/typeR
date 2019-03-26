library(BMS)


### Name: topmodels.bma
### Title: Model Binaries and their Posterior model Probabilities
### Aliases: topmodels.bma
### Keywords: utilities

### ** Examples

data(datafls)
#sample with a limited data set for demonstration
mm=bms(datafls[,1:12],nmodel=20)

#show binaries for all
topmodels.bma(mm)

#show binaries for 2nd and 3rd best model, without the model probs
topmodels.bma(mm[2:3])[1:11,]

#access model binaries directly
mm$topmod$bool_binary()




