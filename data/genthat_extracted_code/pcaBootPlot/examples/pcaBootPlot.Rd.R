library(pcaBootPlot)


### Name: pcaBootPlot
### Title: Create 2D PCA Plots with Bootstrapping
### Aliases: pcaBootPlot

### ** Examples

sample1=rnorm(n=100, mean=100, sd=10)
sample2=jitter(sample1, factor=10, amount=10)
sample3=rnorm(n=100, mean=100, sd=10)

data <- data.frame(ID=c(1:100), sample1, sample2, sample3)

pcaBootPlot(data, log2.transform = FALSE)



