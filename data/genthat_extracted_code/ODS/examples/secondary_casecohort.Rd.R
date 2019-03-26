library(ODS)


### Name: secondary_casecohort
### Title: Secondary analysis in case-cohort data
### Aliases: secondary_casecohort

### ** Examples

## No test: 
library(ODS)
# take the example data from the ODS package
# please see the documentation for details about the data set casecohort_data_secondary
data <- casecohort_data_secondary

# obtain SRS, CCH and NVsample from the original cohort data based on subj_ind
SRS <- data[data[,1]==1, 2:ncol(data)]
CCH <- data[data[,1]==1 | data[,1]==2, 2:ncol(data)]
NVsample <- data[data[,1]==0, 2:ncol(data)]

# delete the fourth column (columns for X) from the non-validation sample
NVsample <- NVsample[,-4]

Z1.dim <- 4
Z2.dim <- 3
Z3.dim <- 3
secondary_casecohort(SRS, CCH, NVsample, Z1.dim, Z2.dim, Z3.dim)
## End(No test)



