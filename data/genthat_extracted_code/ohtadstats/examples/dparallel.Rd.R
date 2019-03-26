library(ohtadstats)


### Name: dparallel
### Title: Compute Ohta's D Statistics in a manner optimized for
###   parallelization
### Aliases: dparallel

### ** Examples

data(beissinger_data)
dparallel(data_set = beissinger_data,
                     comparisons_per_job = 300,
                     job_id = 1,
                     outfile = "beissinger_comparisons")




