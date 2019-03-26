library(timma)


### Name: graycodeNames
### Title: Names for the predicted sensitivity matrix
### Aliases: graycodeNames

### ** Examples

## Not run: 
##D data(tyner_interaction_binary)
##D data(tyner_sensitivity)
##D k_select<-sffsBinary(tyner_interaction_binary, tyner_sensitivity[, 1])$k_sel
##D gc_timma<-graycode3(length(k_select))
##D select_kinase_names<-dimnames(tyner_interaction_binary)[[2]][k_select]
##D gc_names<-graycodeNames(length(k_select), select_kinase_names, gc_timma$gc_row, gc_timma$gc_col)
## End(Not run)



