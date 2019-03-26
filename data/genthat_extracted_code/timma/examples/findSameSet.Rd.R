library(timma)


### Name: findSameSet
### Title: Find the same columns from two matrices
### Aliases: findSameSet

### ** Examples

## Not run: 
##D data(tyner_interaction_binary)
##D data(tyner_sensitivity)
##D x<-data.frame(tyner_interaction_binary)
##D kinase_names<-dimnames(tyner_interaction_binary)
##D float<-sffsBinary(tyner_interaction_binary, tyner_sensitivity[,1])
##D k_select <- float$k_sel
##D select_kinase_names <- findSameSet(x, k_select, kinase_names)
## End(Not run)



