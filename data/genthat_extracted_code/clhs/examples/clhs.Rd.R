library(clhs)


### Name: clhs.data.frame
### Title: Conditioned Latin Hypercube Sampling
### Aliases: clhs.data.frame clhs.Raster clhs clhs.data.frame
###   clhs.SpatialPointsDataFrame clhs.Raster clhs.SpatialPointsDataFrame

### ** Examples


df <- data.frame(
  a = runif(1000), 
  b = rnorm(1000), 
  c = sample(LETTERS[1:5], size = 1000, replace = TRUE)
)

# Returning the indices of the sampled points
res <- clhs(df, size = 50, iter = 100, progress = FALSE, simple = TRUE)
str(res)

# Returning a cLHS_result object for plotting
res <- clhs(df, size = 50, iter = 100, progress = FALSE, simple = FALSE)
str(res)
plot(res)

# Method DLHS with a linear increase of the strata weight (i.e. probability to be sampled)
# from 1 for the middle starta to 3 for the edge of the distribution
linear_increase <- 1+(2/24)*0:24
eta <- matrix(c(rev(linear_increase), linear_increase), ncol = 2, nrow = 50)
res <- clhs(df, size = 50, iter = 100, eta = eta, progress = FALSE, simple = FALSE)
str(res)
plot(res)  




