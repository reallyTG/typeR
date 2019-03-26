library(CollessLike)


### Name: indices.simulation
### Title: Generates random trees and compute their balance indices
### Aliases: indices.simulation

### ** Examples

#('Repetitions' set as 100 for a fast example)
## No test: 
indices.table = indices.simulation(5,0.5,0.3,repetitions=10)
## End(No test)
## No test: 
head(indices.table)
## End(No test)

#Normalized indices (between 0 and 1)
## No test: 
indices.table = indices.simulation(5,0.5,0.3,repetitions=10,norm=TRUE)
## End(No test)
## No test: 
head(indices.table)
## End(No test)

#Without specifying alpha and gamma
## No test: 
indices.list = indices.simulation(5,repetitions=100)
## End(No test)
#by default alpha=seq(0,1,0.1) and gamma=seq(0,alpha,0.1), thus
## No test: 
length(indices.list) #=66
## End(No test)
#all the elements of the list have a name that identifies its parameters
## No test: 
indices.list$a0.5g0.3
## End(No test)
## No test: 
indices.list$a0.7g0.2
## End(No test)
 



