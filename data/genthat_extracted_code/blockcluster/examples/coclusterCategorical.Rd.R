library(blockcluster)


### Name: coclusterCategorical
### Title: Co-Clustering function for categorical data-sets.
### Aliases: coclusterCategorical

### ** Examples


## Simple example with simulated categorical data
## load data
data(categoricaldata)
## usage of coclusterCategorical function in its most simplest form
out<-coclusterCategorical(categoricaldata,nbcocluster=c(3,2))
## Summarize the output results
summary(out)
## Plot the original and Co-clustered data 
plot(out)




