library(funModeling)


### Name: discretize_df
### Title: Discretize a data frame
### Aliases: discretize_df

### ** Examples

## Not run: 
##D # Getting the bins thresholds for each. If input is missing, will run for all numerical variables.
##D d_bins=discretize_get_bins(data=heart_disease,
##D input=c("resting_blood_pressure", "oldpeak"), n_bins=5)
##D 
##D # Now it can be applied on the same data frame, or in a new one (for example in a predictive model
##D  that change data over time)
##D heart_disease_discretized=discretize_df(data=heart_disease, data_bins=d_bins, stringsAsFactors=T)
##D 
## End(Not run)



