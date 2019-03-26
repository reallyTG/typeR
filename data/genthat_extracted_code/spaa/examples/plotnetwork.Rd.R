library(spaa)


### Name: plotnetwork
### Title: Correlation network plot
### Aliases: plotnetwork
### Keywords: network plot

### ** Examples

data(testdata)
spmatrix <- data2mat(testdata)
result <- sp.pair(spmatrix)
plotnetwork(result$Pearson)

plotnetwork(result$Pearson, linecol = c("orange", "blue"),
number.label = FALSE)

title("Pearson Correlation Network")



