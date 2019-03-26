library(ftsa)


### Name: median.fts
### Title: Median functions for functional time series
### Aliases: median.fts
### Keywords: methods

### ** Examples

# Calculate the median function by the different depth measures.	
median(x = ElNino, method = "hossjercroux")
median(x = ElNino, method = "coordinate")
median(x = ElNino, method = "FM")
median(x = ElNino, method = "mode")
median(x = ElNino, method = "RP")
median(x = ElNino, method = "RPD")
median(x = ElNino, method = "radius", alpha = 0.5, beta = 0.25, weight = "hard")
median(x = ElNino, method = "radius", alpha = 0.5, beta = 0.25, weight = "soft")



