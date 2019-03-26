library(probout)


### Name: allProb
### Title: Outlier probabilities for all observations
### Aliases: allProb
### Keywords: misc

### ** Examples


 set.seed(0)

 lead <- leader(faithful)
 nlead <- length(lead[[1]]$partitions)

# repeat multiple times to account for randomness
 ntimes <- 100
 probs <- matrix( NA, nlead, ntimes)
 for (i in 1:ntimes) {
    probs[,i] <- partProb( simData(lead[[1]]), method = "distance")
 }

# median probability for each partition
 partprobs <- apply( probs, 1, median)

 quantile(partprobs)

# plot leaders with outlier probability > .95
 plot( faithful[,1], faithful[,2], pch = 16, cex = .5,
       main = "red : instances with outlier probability > .95")
 allprobs <- allProb( lead[[1]], partprobs)
 out <- allprobs > .95
 points( faithful[out,1], faithful[out,2], pch = 8, cex = 1, col = "red")




