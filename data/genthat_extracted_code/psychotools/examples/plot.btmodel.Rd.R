library(psychotools)


### Name: plot.btmodel
### Title: Visualizing Bradley-Terry Models
### Aliases: plot.btmodel
### Keywords: hplot

### ** Examples

## data
data("GermanParties2009", package = "psychotools")

## Bradley-Terry model
bt <- btmodel(GermanParties2009$preference)
plot(bt)
plot(bt, worth = FALSE)
plot(bt, index = FALSE)



