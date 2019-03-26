library(GeneCycle)


### Name: avgp
### Title: Average Periodogram for Multiple (Genetic) Time Series
### Aliases: avgp avpg
### Keywords: ts

### ** Examples

# load GeneCycle library
library("GeneCycle")

# load data set
data(caulobacter)

# how many samples and how many genes?
dim(caulobacter)

# average periodogram
avgp.caulobacter <- avgp(caulobacter, "Caulobacter")
avgp.caulobacter

# just compute and don't plot 
avgp(caulobacter, "Caulobacter", plot=FALSE)



