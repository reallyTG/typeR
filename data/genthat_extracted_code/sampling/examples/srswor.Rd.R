library(sampling)


### Name: srswor
### Title: Simple random sampling without replacement
### Aliases: srswor
### Keywords: survey

### ** Examples

############
## Example 1
############
#select a sample
s=srswor(3,10)
#the sample is
(1:10)[s==1]
############
## Example 2
############
data(belgianmunicipalities)
Tot=belgianmunicipalities$Tot04
name=belgianmunicipalities$Commune
n=200
#select a sample
s=srswor(n,length(Tot))  
#the sample is 
as.vector(name[s==1])



