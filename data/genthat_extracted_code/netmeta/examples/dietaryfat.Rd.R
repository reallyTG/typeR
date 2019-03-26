library(netmeta)


### Name: dietaryfat
### Title: Network meta-analysis of dietary fat
### Aliases: dietaryfat
### Keywords: datasets

### ** Examples

data(dietaryfat)

# Transform data from arm-based format to contrast-based format
# Using incidence rate ratios (sm="IRR") as effect measure.
# Note, the argument 'sm' is not necessary as this is the default
# in R function metainc called internally
p1 <- pairwise(list(treat1, treat2, treat3),
               list(d1, d2, d3),
               time=list(years1, years2, years3),
               studlab=ID,
               data=dietaryfat, sm="IRR")
p1

# Conduct network meta-analysis:
net1 <- netmeta(p1)
summary(net1)

# Conduct network meta-analysis using incidence rate differences
# (sm="IRD").
p2 <- pairwise(list(treat1, treat2, treat3),
               list(d1, d2, d3),
               time=list(years1, years2, years3),
               studlab=ID,
               data=dietaryfat, sm="IRD")
net2 <- netmeta(p2)
summary(net2)

# Draw network graph
netgraph(net1, points=TRUE, cex.points=3, cex=1.25)
tname <- c("Control","Diet", "Diet 2")
netgraph(net1, points=TRUE, cex.points=3, cex=1.25, labels=tname)



