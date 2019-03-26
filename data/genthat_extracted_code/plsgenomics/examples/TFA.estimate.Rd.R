library(plsgenomics)


### Name: TFA.estimate
### Title: Prediction of Transcription Factor Activities using PLS
### Aliases: TFA.estimate
### Keywords: regression

### ** Examples

# load plsgenomics library
library(plsgenomics)

# load Ecoli data
data(Ecoli)

# estimate TFAs based on 3 latent components
TFA.estimate(Ecoli$CONNECdata,Ecoli$GEdata,ncomp=3,nruncv=0)

# estimate TFAs and determine the best number of latent components simultaneously
TFA.estimate(Ecoli$CONNECdata,Ecoli$GEdata,ncomp=1:5,nruncv=20)




