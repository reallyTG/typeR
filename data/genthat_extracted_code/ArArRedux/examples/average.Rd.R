library(ArArRedux)


### Name: average
### Title: Calculate the arithmetic mean
### Aliases: average

### ** Examples

data(Melbourne)
K <- average(Melbourne$X,grep("K:",Melbourne$X$labels),newlabel="K-glass")
plotcorr(K)



