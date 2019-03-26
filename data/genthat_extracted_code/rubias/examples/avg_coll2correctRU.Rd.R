library(rubias)


### Name: avg_coll2correctRU
### Title: Get the average within-RU assignment rate for each collection
### Aliases: avg_coll2correctRU
### Keywords: internal

### ** Examples

params <- tcf2param_list(alewife, 17)
SL <- geno_logL(params) %>% exp() %>% apply(2, function(x) x/sum(x))
correct <- avg_coll2correctRU(SL, params$coll, params$RU_starts, params$RU_vec)



