library(probout)


### Name: leader
### Title: Leader Algorithm for Data Partitioning
### Aliases: leader
### Keywords: cluster

### ** Examples


 radius.default <- LWradius(nrow(faithful),ncol(faithful))
 lead <- leader(faithful, radius = c(0,radius.default))

# number of partitions for each radius
 sapply(lead, function(x) length(x$partitions))

# plot the leaders for the non-zero radius
 plot( faithful[,1], faithful[,2], 
       main = "blue indicates leaders (default radius)", 
       pch = 16, cex = .5)
 ldrs <- lead[[2]]$leaders
 points( faithful[ldrs,1], faithful[ldrs,2], 
         pch = 8, col = "dodgerblue", cex = .5)




