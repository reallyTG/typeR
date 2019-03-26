library(imputeTS)


### Name: plotNA.imputations
### Title: Visualize Imputed Values
### Aliases: plotNA.imputations

### ** Examples

#Example 1: Visualize the values that were imputed by na.mean in the time series
impMean.Airgap <- na.mean(tsAirgap)
plotNA.imputations(tsAirgap, impMean.Airgap)


#Example 2: Visualize the values that were imputed by na.locf and the true values in the time series
impLOCF.Airgap <- na.locf(tsAirgap)
plotNA.imputations(tsAirgap, impLOCF.Airgap, tsAirgapComplete)

#Example 3: Same as example 1, just written with pipe operator
tsAirgap %>% na.mean %>% plotNA.imputations(x.withNA = tsAirgap)




