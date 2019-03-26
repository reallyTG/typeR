library(blockcluster)


### Name: coclusterBinary
### Title: Co-Clustering function for Binary data.
### Aliases: coclusterBinary

### ** Examples


## Simple example with simulated binary data
## load data
data(binarydata)
## usage of coclusterBinary function in its most simplest form
out<-coclusterBinary(binarydata,nbcocluster=c(2,3))
## Summarize the output results
summary(out)
## Plot the original and Co-clustered data 
plot(out)




