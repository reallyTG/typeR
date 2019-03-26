library(FlowScreen)


### Name: dr.seas
### Title: Find the start, middle, end, and duration of seasonal droughts
### Aliases: dr.seas

### ** Examples

data(cania.sub.ts)
res <- dr.seas(cania.sub.ts)
res2 <- screen.metric(res[,1], "Day of Year")



