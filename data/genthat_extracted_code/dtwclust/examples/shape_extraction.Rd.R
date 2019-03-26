library(dtwclust)


### Name: shape_extraction
### Title: Shape average of several time series
### Aliases: shape_extraction

### ** Examples


# Sample data
data(uciCT)

# Normalize desired subset
X <- zscore(CharTraj[1:5])

# Obtain centroid series
C <- shape_extraction(X)

# Result
matplot(do.call(cbind, X),
        type = "l", col = 1:5)
points(C)




