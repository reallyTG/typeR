library(imputeR)


### Name: SimIm
### Title: Introduce some missing values into a data matrix
### Aliases: SimIm
### Keywords: imputation simulation,

### ** Examples

# Create data without missing values as example
simdata <- matrix(rnorm(100), 10, 10)

# Now let's introduce some missing values into the dataset
missingdata <- SimIm(simdata, p = 0.15)

# count the number of missing values afterwards
sum(is.na(missingdata))

#------------------

# There is no missing values in the original parkinson data
data(parkinson)

# Let's introduce some missing values into the dataset
missdata <- SimIm(parkinson, 0.1)

# count the number of missing values afterwards
sum(is.na(missdata))



