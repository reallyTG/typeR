library(HiveR)


### Name: adj2HPD
### Title: Process an Adjacency Graph into a HivePlotData Object
### Aliases: adj2HPD
### Keywords: utilities

### ** Examples


### Example 1: a bipartite network
### Note: this first example has questionable scientific value!
### The purpose is to show how to troubleshoot and
### manipulate a HivePlotData object.

require(bipartite)
data(Safariland) # This is a bipartite network

# You may wish to do ?Safariland or ?Safari for background

hive1 <- adj2HPD(Safariland, desc = "Safariland data set from bipartite")
sumHPD(hive1)

# Note that all nodes are one axis with radius 1. Process further:

hive2 <- mineHPD(hive1, option = "rad <- tot.edge.count")
sumHPD(hive2)

# All nodes still on 1 axis but degree has been used to set radius

# Process further:

hive3 <- mineHPD(hive2, option = "axis <- source.man.sink")
sumHPD(hive3, chk.all = TRUE)

# Note that mineHPD is generating some warnings, telling us
# that the first 9 nodes were not assigned to an axis.  Direct
# inspection of the data shows that these nodes are insects
# that did not visit any of the flowers in this particular study.

# Pretty up a few things, then plot:

hive3$edges$weight <- sqrt(hive3$edges$weight)*0.5
hive3$nodes$size <- 0.5
plotHive(hive3)

# This is a one-sided hive plot of 2 axes, which results
# from the curvature of the splines.  We can manually fix
# this by reversing the ends of edges as follows:

for (n in seq(1, length(hive3$edges$id1), by = 2)) {
	a <- hive3$edges$id1[n]
	b <- hive3$edges$id2[n]
	hive3$edges$id1[n] <- b
	hive3$edges$id2[n] <- a
	}

plotHive(hive3)

### Example 2, a simple random adjacency matrix
set.seed(31)
nr <- 20
nc <- 15
M <- matrix(floor(runif(nc*nr, 0, 10)), ncol = nc)
colnames(M) <- sample(c(letters, LETTERS), nc, replace = FALSE)
rownames(M) <- sample(c(letters, LETTERS), nr, replace = FALSE)
hive4 <- adj2HPD(M)
sumHPD(hive4)




