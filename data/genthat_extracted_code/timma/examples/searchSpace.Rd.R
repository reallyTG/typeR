library(timma)


### Name: searchSpace
### Title: Generate search space
### Aliases: searchSpace

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
num<-length(tyner_sensitivity[,1])
k_set<-rep(0, dim(tyner_interaction_binary)[2])
k_set[1]<-1
space<-searchSpace(num, k_set, tyner_interaction_binary, tyner_sensitivity[,1])



