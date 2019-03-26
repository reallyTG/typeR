library(sampling)


### Name: UPsampford
### Title: Sampford sampling
### Aliases: UPsampford
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
s=UPsampford(pik)
#the sample is
(1:length(pik))[s==1]



