library(ReIns)


### Name: Hill.kopt
### Title: Select optimal threshold for Hill estimator
### Aliases: Hill.kopt

### ** Examples

data(norwegianfire)

# Plot Hill estimator as a function of k
Hill(norwegianfire$size[norwegianfire$year==76],plot=TRUE)

# Add optimal value of k
Hill.kopt(norwegianfire$size[norwegianfire$year==76],add=TRUE)



