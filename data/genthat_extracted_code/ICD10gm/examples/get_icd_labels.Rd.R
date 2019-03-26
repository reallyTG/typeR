library(ICD10gm)


### Name: get_icd_labels
### Title: Returns a data frame with ICD metadata, consisting of year, ICD
###   code and label. Optional arguments allow selection of entries by
###   year, code or label. This is beneficial because the entire history is
###   relatively large and rarely required in full.
### Aliases: get_icd_labels

### ** Examples

get_icd_labels(year = 2019, icd3 = "I25")
get_icd_labels(year = 2019, search = "Asthma")



