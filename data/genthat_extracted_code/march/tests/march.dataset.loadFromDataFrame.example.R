# Create a march dataset from the sleep_df dataframe included in the march package.
sleep <- march.dataset.loadFromDataFrame(sleep_df, MARGIN = 2,
                            weights = NA, missingDataRep = NA)

# Each row of sleep_df contains the data for one subject, so MARGIN was set to 2.

# Most of the subjects have been observed during 7 consecutive years,
# but some subjects have been observed for only 5 or 6 years.
# To load only the first 5 observations of each subject:
sleep.5 <- march.dataset.loadFromDataFrame(sleep_df[,1:5], MARGIN = 2 ,
                            weights = NA, missingDataRep = NA)

# The sleep data are not weighted.
# To add a weighting variable taking value 1.5 for the 500 first subjects
# and value 0.5 for the 500 next:
weighting <- rep(1.5,1000)
weighting[501:1000] <- rep(0.5,500)
sleep.w <- march.dataset.loadFromDataFrame(sleep_df, MARGIN = 2,
                           weights = weighting, missingDataRep = NA)
