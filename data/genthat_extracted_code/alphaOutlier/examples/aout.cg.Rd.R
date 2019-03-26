library(alphaOutlier)


### Name: aout.cg
### Title: Find alpha-outliers in conditional Gaussian data
### Aliases: aout.cg
### Keywords: distribution

### ** Examples
# Rats' weights data example taken from Edwards (2000)
ratweight <- cbind(Drug = c(1, 1, 2, 3, 1, 1, 2, 3, 1, 2, 3, 3, 1, 2, 2, 3, 1, 
                            2, 2, 3, 1, 2, 3, 3), 
                   Week1 = c(5, 7, 9, 14, 7, 8, 7, 14, 9, 7, 21, 12, 5, 7, 6, 
                             17, 6, 10, 6, 14, 9, 8, 16, 10))
aout.cg(ratweight, 
        list(p = c(1/3, 1/3, 1/3), mu = c(7, 7, 14), sigma = c(1.6, 1.4, 3.3)))



