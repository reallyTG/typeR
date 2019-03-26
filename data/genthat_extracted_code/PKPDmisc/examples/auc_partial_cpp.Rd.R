library(PKPDmisc)


### Name: auc_partial_cpp
### Title: calculate partial AUC
### Aliases: auc_partial_cpp

### ** Examples

## Not run: 
##D library(dplyr)
##D sd_oral_richpk %>% group_by(ID) %>% 
##D   summarize(pauc0_12 = auc_partial_cpp(Time, Conc, c(0, 12)))
## End(Not run)



