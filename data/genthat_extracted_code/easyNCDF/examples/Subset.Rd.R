library(easyNCDF)


### Name: Subset
### Title: Subset a Data Array
### Aliases: Subset
### Keywords: dplot

### ** Examples

# Create an array from R with data for 3 'var', 3 'member' and 3 'time'
a <- array(1:27, dim = c(var = 3, member = 3, time = 3))
# Take a subset with all 'member' and 'time' for the 1st 'var'
b <- Subset(a, 'var', 1)



