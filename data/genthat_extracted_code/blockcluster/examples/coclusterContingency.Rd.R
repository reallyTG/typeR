library(blockcluster)


### Name: coclusterContingency
### Title: Co-Clustering function.
### Aliases: coclusterContingency

### ** Examples


## Simple example with simulated contingency data
## load data
data(contingencydataunknown)
## usage of coclusterContingency function in its most simplest form
strategy = coclusterStrategy( nbinititerations = 5, nbxem = 2, nbiterations_int = 2
                            , nbiterationsxem = 10, nbiterationsXEM = 100, epsilonXEM=1e-5)
out<-coclusterContingency( contingencydataunknown, nbcocluster=c(2,3), strategy = strategy)
## Summarize the output results
summary(out)
## Plot the original and Co-clustered data 
plot(out)




