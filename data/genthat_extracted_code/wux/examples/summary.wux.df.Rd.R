library(wux)


### Name: summary
### Title: Summary of a WUX data.frame
### Aliases: summary.wux.df
### Keywords: univar methods print manip

### ** Examples

## ENSEMBLES data summary
data(ensembles)
summary(ensembles)

## CMIP3 data summary
data(cmip3_2100)
summary(cmip3_2100, average.over.gcm.runs = TRUE) # Average GCMs with different 
                                                      # initial conditions
                                                      
## structure of summaryWuxdf object
data(ensembles_gcms)
ensembles.gcms.summary <- summary(ensembles_gcms)
ensembles.gcms.summary  # summary of 8 GCMs
str(ensembles.gcms.summary)



