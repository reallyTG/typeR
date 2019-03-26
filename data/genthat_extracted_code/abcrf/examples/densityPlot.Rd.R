library(abcrf)


### Name: densityPlot
### Title: Plot the posterior density given a new summary statistic
### Aliases: densityPlot densityPlot.regAbcrf

### ** Examples

data(snp)
modindex <- snp$modindex
sumsta <- snp$sumsta[modindex == "3",]
r <- snp$param$r[modindex == "3"]
r <- r[1:500]
sumsta <- sumsta[1:500,]
data2 <- data.frame(r, sumsta)
model.rf.r <- regAbcrf(r~., data2, ntree=100)
data(snp.obs)
densityPlot(model.rf.r, snp.obs, data2, ylab="density", main = "Posterior density of r")



