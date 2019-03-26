library(adespatial)


### Name: aem.time
### Title: AEM for time series
### Aliases: aem.time
### Keywords: multivariate spatial

### ** Examples


# Time series containing 20 equispaced observations
out <- aem.time(20, moran = TRUE)

# Time series containing 20 observations with unequal spacing
# Generate (n-1) random interpoint distances
distances <- runif(19,1,5)

# Compute weights representing the ease of communication among points
w <- 1/(distances/max(distances))

# Compute the AEM eigenfunctions
out <- aem.time(20, w = w, moran = TRUE)




