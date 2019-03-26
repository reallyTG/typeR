library(sampling)


### Name: UPmultinomial
### Title: Multinomial sampling
### Aliases: UPmultinomial
### Keywords: survey

### ** Examples

#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPmultinomial(pik)
#the sample is
(1:length(pik))[s==1] 



