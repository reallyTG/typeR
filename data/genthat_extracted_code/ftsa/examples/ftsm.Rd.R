library(ftsa)


### Name: ftsm
### Title: Fit functional time series model
### Aliases: ftsm
### Keywords: models

### ** Examples

# ElNino is an object of class sliced functional time series, constructed 
# from a univariate time series. 
# By default, all observations are assigned with equal weighting. 	
ftsm(y = ElNino, order = 6, method = "classical", weight = FALSE)
# When weight = TRUE, geometrically decaying weights are used.
ftsm(y = ElNino, order = 6, method = "classical", weight = TRUE)



