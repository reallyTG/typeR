library(VIM)


### Name: pairsVIM
### Title: Scatterplot Matrices
### Aliases: pairsVIM
### Keywords: hplot

### ** Examples


data(sleep, package = "VIM")
x <- sleep[, -(8:10)]
x[,c(1,2,4,6,7)] <- log10(x[,c(1,2,4,6,7)])
pairsVIM(x)




