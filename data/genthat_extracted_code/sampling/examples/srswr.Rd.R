library(sampling)


### Name: srswr
### Title: Simple random sampling with replacement
### Aliases: srswr
### Keywords: survey

### ** Examples

s=srswr(3,10)
#the selected units are 
(1:10)[s!=0]
#with the number of replicates 
s[s!=0]



