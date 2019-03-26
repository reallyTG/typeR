library(probout)


### Name: partProb
### Title: Partition outlier probabilities
### Aliases: partProb
### Keywords: nonparametric

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

 quantile(probs)

# plot leaders with outlier probability > .95
 plot( faithful[,1], faithful[,2], pch = 16, cex = .5,
       main = "red : leaders with outlier probability > .95")
 out <- partprobs > .95
 l <- lead[[1]]$leaders
 points( faithful[l[out],1], faithful[l[out],2], pch = 8, cex = 1, col = "red")




