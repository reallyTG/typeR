library(sampling)


### Name: UPrandompivotal
### Title: Random pivotal sampling
### Aliases: UPrandompivotal
### Keywords: survey

### ** Examples

#define the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#select a sample
s=UPrandompivotal(pik)
#the sample is
(1:length(pik))[s==1]



