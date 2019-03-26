library(pairwise)


### Name: bfiN_miss
### Title: 5 polytomous personality items
### Aliases: bfiN_miss
### Keywords: datasets

### ** Examples

data(bfiN_miss)
dim(bfiN_miss)
##############################################################
names(bfiN_miss) # show all variable names of data.frame bfiN_miss
range(bfiN_miss,na.rm=TRUE) # checking the valid response range
colSums(is.na(bfiN_miss))/dim(bfiN_miss)[1] # percentage of missing per variable



