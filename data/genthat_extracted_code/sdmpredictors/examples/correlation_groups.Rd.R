library(sdmpredictors)


### Name: correlation_groups
### Title: Groups layers based on the Pearson correlation
### Aliases: correlation_groups

### ** Examples


corr <- layers_correlation(c("BO_calcite", "BO_damin", "MS_bathy_5m"))
print(corr)
print(correlation_groups(corr, max_correlation=0.6))




