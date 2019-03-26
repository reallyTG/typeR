library(epiDisplay)


### Name: Matched case-control study
### Title: Datasets on a matched case-control study of esophageal cancer
### Aliases: VC1to1 VC1to6
### Keywords: datasets

### ** Examples

data(VC1to6)
.data <- VC1to6
des(.data)
with(.data, matchTab(case, alcohol, matset))
rm(.data)



