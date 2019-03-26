library(rubias)


### Name: list_diploid_params
### Title: Collect essential data values before mixture proportion
###   estimation
### Aliases: list_diploid_params
### Keywords: internal

### ** Examples

example(allelic_list)
PO <- as.integer(factor(ale_long$clean_short$collection))
coll_N <- as.vector(table(PO))

Colls_by_RU <- dplyr::count(ale_long$clean_short, repunit, collection) %>%
   dplyr::select(-n)
 PC <- rep(0, length(unique((Colls_by_RU$repunit))))
 for(i in 1:nrow(Colls_by_RU)) {
   PC[Colls_by_RU$repunit[i]] <- PC[Colls_by_RU$repunit[i]] + 1
 }
RU_starts <- c(0, cumsum(PC))
RU_vec <- as.integer(Colls_by_RU$collection)
param_list <- list_diploid_params(ale_ac, ale_alle_list, PO, coll_N, RU_vec, RU_starts)




