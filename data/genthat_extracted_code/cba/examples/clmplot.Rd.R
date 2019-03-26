library(cba)


### Name: clmplot
### Title: Plotting Logical Matrices
### Aliases: clmplot
### Keywords: cluster hplot

### ** Examples

x <- matrix(sample(c(FALSE,TRUE),100,rep=TRUE),ncol=10)
clmplot(x, order=TRUE, axes=TRUE)
clmplot(x, col=rep(c(1,2),each=5))
clmplot(x, col=rep(c("red","blue"),each=5))
clmplot(x, col=rep(c("red","blue"),each=5), col.bycol=TRUE)
## Not run: 
##D ### continue example (see rockCluster)
##D col <- Votes$Class                                  # color by party
##D levels(col) <- c("red","blue")
##D op <- par(mfrow=c(1,2), pty="s")
##D clmplot(x, order=TRUE, col=as.character(col), main="Parties")
##D col <- rf$cl                                        # color by cluster
##D levels(col) <- c("blue","red","green", "black")     # map NA to black
##D clmplot(x, order=TRUE, col=as.character(col), main="Clusters")
##D par(op)
## End(Not run)



