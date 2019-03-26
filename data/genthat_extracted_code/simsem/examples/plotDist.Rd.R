library(simsem)


### Name: plotDist
### Title: Plot a distribution of a data distribution object
### Aliases: plotDist

### ** Examples


datadist <- bindDist(skewness = c(0, -2, 2), kurtosis = c(2, 4, 4))

# Plot the joint distribution of Variables 1 and 2 with correlation of 0.5
plotDist(datadist, r=0.5, var=1:2)

# Plot the marginal distribution of the variable 3
plotDist(datadist, var=3)

## Not run: 
##D datadist2 <- bindDist(c("chisq", "t", "f"), list(df=5), list(df=3), list(df1=3, df2=5))
##D 
##D # Plot the joint distribution of Variables 1 and 2 with correlation of 0.5
##D plotDist(datadist2, r=0.5, var=1:2)
##D 
##D # Plot the marginal distribution of the variable 3
##D plotDist(datadist2, var=3)
## End(Not run)



