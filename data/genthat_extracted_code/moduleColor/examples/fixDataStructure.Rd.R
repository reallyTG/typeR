library(moduleColor)


### Name: fixDataStructure
### Title: Put single-set data into a form useful for multiset
###   calculations.
### Aliases: fixDataStructure
### Keywords: misc

### ** Examples


singleSetData = matrix(rnorm(100), 10,10);
encapsData = fixDataStructure(singleSetData);
length(encapsData)
names(encapsData[[1]])
dim(encapsData[[1]]$data)
all.equal(encapsData[[1]]$data, singleSetData);




