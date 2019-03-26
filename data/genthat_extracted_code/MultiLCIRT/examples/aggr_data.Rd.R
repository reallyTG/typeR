library(MultiLCIRT)


### Name: aggr_data
### Title: Aggregate data
### Aliases: aggr_data

### ** Examples

# draw a matrix of random responses and find distinct responses
X = matrix(sample(5,100,replace=TRUE),50,2)
out = aggr_data(X)

# find the distinct responses and the corresponding vector of frequencies
# for naep data
data(naep)
X = as.matrix(naep)
out = aggr_data(X)
length(out$freq)



