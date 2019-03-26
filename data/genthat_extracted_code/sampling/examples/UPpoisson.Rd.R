library(sampling)


### Name: UPpoisson
### Title: Poisson sampling
### Aliases: UPpoisson
### Keywords: survey

### ** Examples

############
## Example 1
############
# definition of pik
pik=c(1/3,1/3,1/3)
# selects a sample
s=UPpoisson(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
pik=inclusionprobabilities(Tot,n)
# select a sample
s=UPpoisson(pik)  
#the sample is
getdata(name,s)



