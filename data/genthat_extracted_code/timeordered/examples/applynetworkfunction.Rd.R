library(timeordered)


### Name: applynetworkfunction
### Title: Applies a function (typically a descriptive statistic) to
###   multiple time-aggregated networks
### Aliases: applynetworkfunction
### Keywords: ~kwd1 ~kwd2

### ** Examples

data(ants)
allindivs <- c(union(ants$VertexFrom, ants$VertexTo), "NULL1", "NULL2")
g <- generatetonetwork(ants, allindivs)
td100 <- generatetimedeltas(0,1500,100)
ns100 <- generatenetworkslices(g, td100)
md100 <- applynetworkfunction(ns100, diameter)
tl100 <- generatetimelags(0,1500,100)
nl100 <- generatenetworkslices(g, tl100)
ml100 <- applynetworkfunction(nl100, function(x){diameter(x)})
par(mfrow=c(1,2))
plot(midpoints(td100),unlist(md100),type="l",xlab="Time (window size = 100)",ylab="Diameter")
plot(maxpoints(tl100),unlist(ml100),type="l",xlab="Aggregation time",ylab="Diameter")



