library(timma)


### Name: drugRank
### Title: Generate the list of ranked drug combinations
### Aliases: drugRank

### ** Examples

## Not run: 
##D data(tyner_interaction_binary)
##D data(tyner_sensitivity)
##D float<-sffsBinary(tyner_interaction_binary, tyner_sensitivity[, 1], max_k = 8)
##D k_select<-float$k_sel
##D x<-data.frame(tyner_interaction_binary)
##D kinase_names <- dimnames(x)[[2]]
##D select_kinase_names <- findSameSet(x, k_select, kinase_names)
##D gc_timma <- graycode3(length(k_select))
##D gc_names <- graycodeNames(length(k_select), select_kinase_names, gc_timma$gc_row, gc_timma$gc_col)
##D nr <- gc_names$nr
##D nc <- t(gc_names$nc)
##D timma_row <- nrow(nr) + nrow(nc)
##D timma_col <- ncol(nr) + ncol(nc)
##D timma <- array("", dim = c(timma_row, timma_col))
##D timma[(nrow(nc) + 1):timma_row, 1:ncol(nr)] <- nr
##D timma[1:nrow(nc), (ncol(nr) + 1):timma_col] <- nc
##D timma[(nrow(nc) + 1):timma_row, (ncol(nr) + 1):timma_col] <- float$timma$dummy
##D profile_select<-data.frame(tyner_interaction_binary)[, k_select]
##D drug_combo_rank<-drugRank(profile_select, timma, tyner_sensitivity[, 1])
## End(Not run)



