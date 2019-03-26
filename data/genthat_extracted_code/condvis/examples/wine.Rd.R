library(condvis)


### Name: wine
### Title: Italian wine data
### Aliases: wine
### Keywords: wine

### ** Examples

data(wine)
pairs(wine[, -1], col = factor2color(wine$Class), cex = 0.2)



