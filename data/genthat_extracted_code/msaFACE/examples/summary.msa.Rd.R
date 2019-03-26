library(msaFACE)


### Name: summary.MSA_coef
### Title: Summary for MSA_coef
### Aliases: summary.MSA_coef
### Keywords: utilities

### ** Examples


## Load data
data(GiFACE)

## Perform Moving Subset Analysis
msa_data <- moving_subset_analysis(GiFACE$data, "CO2A_Mean", "BYT", 30, group = GiFACE$year)

## Show summary
summary(msa_data)



