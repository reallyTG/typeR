library(lsr)


### Name: aad
### Title: Mean (average) absolute deviation from the mean
### Aliases: aad

### ** Examples

# basic usage
X <- c(1, 3, 6)  # data 
aad(X)           # returns a value of 2

# removing missing data
X <- c(1, 3, NA, 6)   # data 
aad(X)                # returns NA 
aad(X, na.rm = TRUE)  # returns 2 




