library(netmeta)


### Name: smokingcessation
### Title: Network meta-analysis of interventions for smoking cessation
### Aliases: smokingcessation
### Keywords: datasets

### ** Examples

data(smokingcessation)

# Transform data from arm-based format to contrast-based format
# Argument 'sm' has to be used for odds ratio as summary measure; by
# default the risk ratio is used in the metabin function called
# internally.
p1 <- pairwise(list(treat1, treat2, treat3),
               event=list(event1, event2, event3),
               n=list(n1, n2, n3),
               data=smokingcessation,
               sm="OR")
p1

# Conduct network meta-analysis
net1 <- netmeta(p1)
net1

# Draw network graph
netgraph(net1, points=TRUE, cex.points=3, cex=1.25)
tname <- c("No intervention", "Self-help",
           "Individual counselling", "Group counselling")
netgraph(net1, points=TRUE, cex.points=3, cex=1.25, labels=tname)



