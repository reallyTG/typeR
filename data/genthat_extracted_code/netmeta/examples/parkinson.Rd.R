library(netmeta)


### Name: parkinson
### Title: Network meta-analysis of treatments for Parkinson's disease
### Aliases: parkinson
### Keywords: datasets

### ** Examples

data(parkinson)

# Transform data from arm-based format to contrast-based format
p1 <- pairwise(list(Treatment1, Treatment2, Treatment3),
               n=list(n1, n2, n3),
               mean=list(y1, y2, y3),
               sd=list(sd1, sd2, sd3),
               data=parkinson, studlab=Study)
p1

# Conduct network meta-analysis
net1 <- netmeta(p1)
net1

# Draw network graphs
netgraph(net1, points=TRUE, cex.points=3, cex=1.5,
         thickness="se.fixed")
netgraph(net1, points=TRUE, cex.points=3, cex = 1.5,
         plastic=TRUE, thickness="se.fixed",
         iterate=TRUE)
netgraph(net1, points=TRUE, cex.points=3, cex = 1.5,
         plastic=TRUE, thickness="se.fixed",
         iterate=TRUE, start="eigen")



