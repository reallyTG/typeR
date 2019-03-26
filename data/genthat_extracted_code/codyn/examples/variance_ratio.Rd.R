library(codyn)


### Name: variance_ratio
### Title: Variance Ratio
### Aliases: variance_ratio

### ** Examples

 data(knz_001d)

 # Calculate the variance ratio and CIs averaged within replicates
 # Here the null model is repeated once, for final use it is recommended to set a
 # large bootnumber (eg, 10000)

 res_averagedreplicates <- variance_ratio(knz_001d,
               time.var = "year",
               species.var = "species",
               abundance.var = "abundance",
               bootnumber = 1,
               replicate = "subplot")

 #Calculate the variance ratio and CIs for each replicate

 res_withinreplicates <- variance_ratio(knz_001d,
               time.var = "year",
               species.var = "species",
               abundance.var = "abundance",
               bootnumber = 1,
               replicate = "subplot",
               average.replicates = FALSE)



