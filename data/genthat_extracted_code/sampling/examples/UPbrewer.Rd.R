library(sampling)


### Name: UPbrewer
### Title: Brewer sampling
### Aliases: UPbrewer
### Keywords: survey

### ** Examples

#define the inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPbrewer(pik)
#the sample is
(1:length(pik))[s==1]



