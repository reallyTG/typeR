library(missCompare)


### Name: clean
### Title: Dataframe cleaning for missing data handling
### Aliases: clean

### ** Examples

# basic settings
cleaned <- clean(clindata_miss, missingness_coding = -9)

# setting very conservative removal thresholds
cleaned <- clean(clindata_miss,
                 var_removal_threshold = 0.10,
                 ind_removal_threshold = 0.9,
                 missingness_coding = -9)




