library(blockcluster)


### Name: coclusterContinuous
### Title: Co-Clustering function.
### Aliases: coclusterContinuous

### ** Examples


# Simple example with simulated continuous data
#load data
data(gaussiandata)
#usage of coclusterContinuous function in its most simplest form
out<-coclusterContinuous(gaussiandata,nbcocluster=c(2,3))
#Summarize the output results
summary(out)
#Plot the original and Co-clustered data 
plot(out)





