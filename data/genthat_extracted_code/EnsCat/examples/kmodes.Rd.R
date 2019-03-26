library(EnsCat)


### Name: kmodes
### Title: Run Kmodes
### Aliases: kmodes
### Keywords: lowdimension

### ** Examples

data("zoo")
### Run Kmodes on zoo data with 7 clusters and the first seventh observations as initial modes
kmodes(zoo$obs,k=7,1:7)
### Run Kmodes with seven random initial modes selected from data points
kmodes(zoo$obs,k=7,sort(sample(dim(zoo$obs)[1],7)))



