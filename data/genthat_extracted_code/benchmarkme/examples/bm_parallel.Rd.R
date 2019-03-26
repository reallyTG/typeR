library(benchmarkme)


### Name: bm_parallel
### Title: Benchmark in parallel
### Aliases: bm_parallel

### ** Examples

## Not run: 
##D bm_parallel("bm_matrix_cal_manip", runs = 3, verbose = TRUE, cores = 2)
##D bm = c("bm_matrix_cal_manip","bm_matrix_cal_power", "bm_matrix_cal_sort", 
##D        "bm_matrix_cal_cross_product", "bm_matrix_cal_lm")
##D results = lapply(bm, bm_parallel, 
##D                 runs = 5, verbose = TRUE, cores = 2L)
## End(Not run)



