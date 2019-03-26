library(swCRTdesign)


### Name: swPlot
### Title: Plot of Mean Response/Outcome for Stepped Wedge Cluster
###   Randomized Trial (SW CRT)
### Aliases: swPlot
### Keywords: plot stepped wedge cluster randomized trial

### ** Examples

library(swCRTdesign)
# Example 1 (Generating SW CRT data)
# (binary response with 1 missing value, 5 clusters, 4 time points)

n.Ex1 <- 120
p0.Ex1 <- 0.05
clusters.Ex1 <- c(2,2,1)
dsn.Ex1 <- swDsn( clusters=clusters.Ex1 )
time.Ex1 <- c(1:dsn.Ex1$total.time)*4 - 4
response.Ex1 <- rbinom(n.Ex1 * dsn.Ex1$n.clusters * dsn.Ex1$total.time, 1, p0.Ex1)
response.Ex1[1] <- NA
tx.Ex1 <- as.vector( apply( dsn.Ex1$swDsn, 1, function(z){rep(z, n.Ex1)}) )
time.Ex1 <- rep( time.Ex1, n.Ex1 * dsn.Ex1$n.clusters )
cluster.Ex1 <- rep( 1:dsn.Ex1$n.clusters, each=n.Ex1 * dsn.Ex1$total.time )
data.Ex1 <- data.frame(response.Ex1, tx.Ex1, time.Ex1, cluster.Ex1)

# Example 1 (Mean Response vs Time, by.wave=TRUE, combined.plot=TRUE)
swPlot(response.Ex1, tx.Ex1, time.Ex1, cluster.Ex1, data.Ex1, by.wave=TRUE, 
combined.plot=TRUE, choose.tx.pos="bottomright", choose.legend.pos="bottom")

# Example 2 (Mean Response vs Time, by.wave=TRUE, combined.plot=FALSE)
swPlot(response.Ex1, tx.Ex1, time.Ex1, cluster.Ex1, data.Ex1, by.wave=TRUE, 
combined.plot=FALSE, choose.tx.pos="bottomright", choose.legend.pos="bottom")

# Example 3 (Mean Response vs Time, by.wave=FALSE, combined.plot=TRUE)
swPlot(response.Ex1, tx.Ex1, time.Ex1, cluster.Ex1, data.Ex1, by.wave=FALSE, 
combined.plot=TRUE, choose.tx.pos="bottomright", choose.legend.pos="bottom")

# Example 4 (Mean Response vs Time, by.wave=FALSE, combined.plot=FALSE)
swPlot(response.Ex1, tx.Ex1, time.Ex1, cluster.Ex1, data.Ex1, by.wave=FALSE, 
combined.plot=FALSE, choose.tx.pos="bottomright", choose.legend.pos="bottom")




