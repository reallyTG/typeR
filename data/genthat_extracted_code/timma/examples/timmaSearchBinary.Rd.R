library(timma)


### Name: timmaSearchBinary
### Title: Prediction in the search space with one.sided TIMMA model
### Aliases: timmaSearchBinary

### ** Examples

data(tyner_interaction_binary)
data(tyner_sensitivity)
num<-length(tyner_sensitivity[,1])
k_set<-rep(0, dim(tyner_interaction_binary)[2])
k_set[c(1,2,3)]<-1
space<-searchSpace(num, k_set, tyner_interaction_binary, tyner_sensitivity[,1])
profile_k<-tyner_interaction_binary[, which(k_set==1)]
error<-timmaSearchBinary(profile_k, space, tyner_sensitivity[,1])



