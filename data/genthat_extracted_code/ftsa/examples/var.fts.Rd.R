library(ftsa)


### Name: var.fts
### Title: Variance functions for functional time series
### Aliases: var.fts
### Keywords: methods

### ** Examples

# Fraiman-Muniz depth was arguably the oldest functional depth.	
var(x = ElNino, method = "FM")
var(x = ElNino, method = "coordinate")
var(x = ElNino, method = "mode")
var(x = ElNino, method = "RP")
var(x = ElNino, method = "RPD")
var(x = ElNino, method = "radius", alpha = 0.5, weight = "hard")
var(x = ElNino, method = "radius", alpha = 0.5, weight = "soft")



