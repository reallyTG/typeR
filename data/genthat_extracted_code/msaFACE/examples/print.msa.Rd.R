library(msaFACE)


### Name: print.MSA_coef
### Title: Print MSA_coef
### Aliases: print.MSA_coef show.MSA_coef
### Keywords: utilities

### ** Examples

data(GiFACE)

## Perform Moving Subset Analysis
msa_data <- moving_subset_analysis(GiFACE$data, "CO2A_Mean", "BYT", 30, group = GiFACE$year)

msa_data




