library(blockcluster)


### Name: cocluster
### Title: Co-Clustering function.
### Aliases: cocluster

### ** Examples


# Simple example with simulated binary data
#load data
data(binarydata)
#usage of cocluster function in its most simplest form
out<-cocluster(binarydata,datatype="binary",nbcocluster=c(2,3))
#Summarize the output results
summary(out)
#Plot the original and Co-clustered data 
plot(out)




