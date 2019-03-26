library(FlowScreen)


### Name: pk.bf.stats
### Title: Calculate baseflow peak statistics
### Aliases: pk.bf.stats

### ** Examples

data(cania.sub.ts)
res1 <- pk.bf.stats(cania.sub.ts)

# trend and changepoint plot for baseflow peak start doy
res2 <- screen.metric(res1[,1], "Day of Year")



