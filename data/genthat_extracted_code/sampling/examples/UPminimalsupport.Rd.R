library(sampling)


### Name: UPminimalsupport
### Title: Minimal support sampling
### Aliases: UPminimalsupport
### Keywords: survey

### ** Examples

############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPminimalsupport(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
pik=inclusionprobabilities(Tot,200)
#selects a sample
s=UPminimalsupport(pik)  
#the sample is
as.vector(name[s==1])



