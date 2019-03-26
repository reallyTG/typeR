library(qlcMatrix)


### Name: splitTable
### Title: Construct sparse matrices from a nominal matrix/dataframe
### Aliases: splitTable

### ** Examples

# start with a simple example from the MASS library
# compare the original data with the encoding as sparse matrices
library(MASS)
farms
splitTable(farms)

# As a more involved example, consider the WALS data included in this package
# Transforming the reasonably large WALS data.frame \code{wals$data} is fast
# (2566 observations, 131 attributes, 630 unique values)
# The function `str' gives a useful summary of the result of the splitting
data(wals)
system.time(W <- splitTable(wals$data))
str(W) 

# Some basic use examples on the complete WALS data.
# The OV-matrix can be used to quickly count the number of similarities 
# between all pairs of observations. Note that with the large amount of missing values
# the resulting numbers are not really meaningfull. Some normalisation is necessary.
system.time( O <- tcrossprod(W$OV*1) )
O[1:10,1:10]

# The number of comparisons available for each pair of attributes
system.time( N <- crossprod(tcrossprod(W$OV*1, W$AV*1)) )
N[1:10,1:10]

# compute the number of available datapoints per observation (language) in WALS
# once the sparse matrices W are computed, such calculations are much quicker than 'apply'
system.time( avail1 <- rowSums(W$OV) )
system.time( avail2 <- apply(wals$data,1,function(x){sum(!is.na(x))}))
names(avail2) <- NULL
all.equal(avail1, avail2)

# Very unequal availability of data over languages in WALS
hist(avail1)



