library(coala)


### Name: calc_sumstats_from_data
### Title: Calculate summary statistics for biological data
### Aliases: calc_sumstats_from_data

### ** Examples

segsites <- create_segsites(matrix(c(1, 0, 0,
                                     1, 1, 0,
                                     0, 0, 1), 3, 3, TRUE),
                            c(.1, .3, .5))
model <- coal_model(3, 1) +
  sumstat_sfs() +
  sumstat_nucleotide_div() +
  sumstat_mcmf()
sumstats <- calc_sumstats_from_data(model, list(segsites))
print(sumstats)



