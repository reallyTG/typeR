library(ftsa)


### Name: mean.fts
### Title: Mean functions for functional time series
### Aliases: mean.fts
### Keywords: methods

### ** Examples

# Calculate the mean function by the different depth measures.	
mean(x = ElNino, method = "coordinate")
mean(x = ElNino, method = "FM")
mean(x = ElNino, method = "mode")
mean(x = ElNino, method = "RP")
mean(x = ElNino, method = "RPD")
mean(x = ElNino, method = "radius", alpha = 0.5, beta = 0.25, weight = "hard")
mean(x = ElNino, method = "radius", alpha = 0.5, beta = 0.25, weight = "soft")



