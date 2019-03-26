library(pairwise)


### Name: deltapar
### Title: Compute delta parameters from thurstonian thresholds
### Aliases: deltapar

### ** Examples

######################
data(sim200x3) # loading reponse data
ip <- pair(sim200x3,m = c(2,3,3)) # compute item parameters
summary(ip) # have a look at the results (thurstonian thresholds)
deltapar(ip) # compute delta parameters from these 



