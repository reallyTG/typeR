library(datadr)


### Name: drQuantile
### Title: Sample Quantiles for 'ddf' Objects
### Aliases: drQuantile

### ** Examples

# break the iris data into k/v pairs
irisSplit <- list(
  list("1", iris[1:10,]), list("2", iris[11:110,]), list("3", iris[111:150,])
)
# represent it as ddf
irisSplit <- ddf(irisSplit, update = TRUE)

# approximate quantiles over the divided data set
probs <- seq(0, 1, 0.005)
iq <- drQuantile(irisSplit, var = "Sepal.Length", tails = 0, probs = probs)
plot(iq$fval, iq$q)

# compare to the all-data quantile "type 1" result
plot(probs, quantile(iris$Sepal.Length, probs = probs, type = 1))




