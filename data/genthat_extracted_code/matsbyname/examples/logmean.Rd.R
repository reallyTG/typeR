library(matsbyname)


### Name: logmean
### Title: Logarithmic mean of two numbers
### Aliases: logmean

### ** Examples

matsbyname:::logmean(0, 0) # 0
matsbyname:::logmean(0, 1) # 0
matsbyname:::logmean(1, 0) # 0
matsbyname:::logmean(1, 1) # 1
matsbyname:::logmean(2, 1)
matsbyname:::logmean(1, 2) # commutative
matsbyname:::logmean(1, 10) # base = exp(1), the default
matsbyname:::logmean(1, 10, base = 10)



