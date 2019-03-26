library(coala)


### Name: sumstat_ihh
### Title: Summary Statistic: Integrated Extended Haplotype Homozygosity
### Aliases: sumstat_ihh

### ** Examples

  model <- coal_model(20, 1, 1000) +
    feat_mutation(1000) +
    sumstat_ihh()
## Not run: 
##D     stat <- simulate(model)
##D     print(stat$ihh)
## End(Not run)



