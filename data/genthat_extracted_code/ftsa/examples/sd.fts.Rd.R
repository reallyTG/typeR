library(ftsa)


### Name: sd.fts
### Title: Standard deviation functions for functional time series
### Aliases: sd.fts
### Keywords: methods

### ** Examples

# Fraiman-Muniz depth was arguably the oldest functional depth.	
sd(x = ElNino, method = "FM")
sd(x = ElNino, method = "coordinate")
sd(x = ElNino, method = "mode")
sd(x = ElNino, method = "RP")
sd(x = ElNino, method = "RPD")
sd(x = ElNino, method = "radius", alpha = 0.5, weight = "hard")
sd(x = ElNino, method = "radius", alpha = 0.5, weight = "soft")



