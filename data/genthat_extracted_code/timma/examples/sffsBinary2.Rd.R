library(timma)


### Name: sffsBinary2
### Title: Model selection with filtered binary drug-target interaction
###   data
### Aliases: sffsBinary2

### ** Examples

## Not run: 
##D data(tyner_interaction_binary)
##D data(tyner_sensitivity)
##D profile<-tyner_interaction_binary[,c(-1, -2, -5)]
##D num<-length(tyner_sensitivity[,1])
##D k_set<-rep(0, dim(profile)[2])
##D k_set[1]<-1
##D result<-sffsBinary2(profile, tyner_sensitivity[,1], new_initial_list = k_set, max_k=2)
## End(Not run)



