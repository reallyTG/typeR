library(echor)


### Name: downloadDMRs
### Title: Download Multiple DMRs
### Aliases: downloadDMRs

### ** Examples

## No test: 
## This example requires an internet connection to run

## Retrieve multiple DMRs for flow

df <- data_frame("p_id" = c('TX0119407', 'TX0132187', 'TX040237'))
df <- downloadDMRs(df, p_id)
## End(No test)



