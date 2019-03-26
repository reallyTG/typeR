library(FlowScreen)


### Name: pk.cov
### Title: Center of Volume
### Aliases: pk.cov

### ** Examples

data(cania.sub.ts)
res1 <- pk.cov(cania.sub.ts)

# trend and changepoint plot for baseflow peak start doy
res2 <- screen.metric(res1[,2], "Day of Year")



