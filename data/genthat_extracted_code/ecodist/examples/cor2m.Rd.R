library(ecodist)


### Name: cor2m
### Title: Two-matrix correlation table
### Aliases: cor2m
### Keywords: multivariate

### ** Examples

data(graze)
speciesdata <- graze[, 3:7]
envdata <- graze[, 1:2]
sppenv.cor <- cor2m(envdata, speciesdata)
print(sppenv.cor, na.print="")



