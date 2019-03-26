library(archdata)


### Name: EIAGraves
### Title: Early Iron Age Graves - Tell el-Far'ah, Palestine
### Aliases: EIAGraves
### Keywords: datasets

### ** Examples

data(EIAGraves)
# How many ceramics of each type?
# Exclude the first column which is the ceramic type number
rowSums(EIAGraves[, -1])
# How many tomb groups contain each type?
rowSums(EIAGraves[, -1]>0)
# How many ceramics in each tomb group?
colSums(EIAGraves[, -1])
# How many types are found in each tomb group?
colSums(EIAGraves[, -1]>0)



