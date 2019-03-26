library(BKPC)


### Name: plot.marginalRelevance
### Title: Plot marginalRelevance Objects
### Aliases: plot.marginalRelevance

### ** Examples


data(microarray)

profiles <- as.matrix(microarray[, -2309])
tumourType <-  microarray[, 2309]
 
 margRelv <- marginalRelevance(profiles, tumourType)


# plot 30 gene profiles with highest marginal relevance score
 plot(margRelv, type = "parallelcoord", n.feat = 50, col = tumourType )


## Not run: 
##D 
##D library(kernlab)
##D data(spam)
##D 
##D test <- sample(1:4601,2000)
##D 
##D 
##D dt <- as.matrix(spam[-test ,-58])
##D labels <- spam[-test , 58]
##D 
##D  
##D margRelv <- marginalRelevance(dt, labels)
##D 
##D #plot MR scores
##D plot(margRelv)
##D 
##D plot(margRelv , col = labels, type = "pairs", n.feat = 5)
##D plot(margRelv , col = labels, type = "parallelcoord", n.feat = 30)
##D 
##D 
##D # test set
##D plot(margRelv , as.matrix(spam[test ,-58]), col = spam[test , 58], 
##D type = "pairs", n.feat = 5)
##D 
##D plot(margRelv , as.matrix(spam[test ,-58]), col = spam[test , 58], 
##D type = "parallelcoord", n.feat = 30)
##D 
##D 
##D 
##D  
##D 
##D  
## End(Not run)



