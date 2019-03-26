library(ICD10gm)


### Name: get_icd_history
### Title: Returns a data frame with ICD transition history, consisting of
###   year, ICD code and label. Optional arguments allow selection of
###   entries by year or ICD code. This is beneficial because the entire
###   history is relatively large and rarely required in full.
### Aliases: get_icd_history

### ** Examples

get_icd_history(years = 2009:2010, icd3 = "K52")



