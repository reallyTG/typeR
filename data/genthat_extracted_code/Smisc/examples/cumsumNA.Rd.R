library(Smisc)


### Name: cumsumNA
### Title: Computes the cummulative sum of a vector without propagating NAs
### Aliases: cumsumNA
### Keywords: misc

### ** Examples

# Compare to cumsum()
x <- as.integer(c(5, 2, 7, 9, 0, -1))
cumsum(x)
cumsumNA(x)

# Now with missing values
x[c(2,4)] <- NA
print(x)
cumsum(x)
cumsumNA(x)



