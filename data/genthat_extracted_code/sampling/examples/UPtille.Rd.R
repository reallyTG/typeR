library(sampling)


### Name: UPtille
### Title: Tille sampling
### Aliases: UPtille
### Keywords: survey

### ** Examples

############
## Example 1
############
#defines the prescribed inclusion probabilities
pik=c(0.2,0.7,0.8,0.5,0.4,0.4)
#selects a sample
s=UPtille(pik)
#the sample is
(1:length(pik))[s==1]
############
## Example 2
############
# see the vignette (UPexamples.pdf)



