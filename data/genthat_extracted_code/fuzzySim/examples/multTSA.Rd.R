library(fuzzySim)


### Name: multTSA
### Title: Trend Surface Analysis for multiple species
### Aliases: multTSA
### Keywords: spatial multivariate regression models

### ** Examples

data(rotif.env)

head(rotif.env)

names(rotif.env)

tsa <- multTSA(rotif.env, sp.cols = 18:20, 
coord.cols = c("Longitude", "Latitude"), id.col = 1)

head(tsa)



