library(mrfDepth)


### Name: medcouple
### Title: A robust measure of skewness for univariate data
### Aliases: medcouple
### Keywords: multivariate

### ** Examples

# Calculate the medcouple of a bivariate data set.
# Note that the medcouple of each variable is returned.
data(bloodfat)
medcouple(bloodfat)

# For smaller data sets it is advisable to calculate
# the medcouple on both the sample and the reflected sample.
small.data <- bloodfat[1:25,]
medcouple(small.data, do.reflect = FALSE)
-medcouple(-small.data, do.reflect = FALSE)
# Small difference are due to numerical instabilities. 
# Use the option do.reflect to increase expected accuracy. 
medcouple(small.data, do.reflect = TRUE)



