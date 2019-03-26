library(HighDimOut)


### Name: Func.SOD
### Title: Subspace outlier detection (SOD) algorithm
### Aliases: Func.SOD

### ** Examples

library(ggplot2)
res.SOD <- Func.SOD(data = TestData[,1:2], k.nn = 10, k.sel = 5, alpha = 0.8)
data.temp <- TestData[,1:2]
data.temp$Ind <- NA
data.temp[order(res.SOD, decreasing = TRUE)[1:10],"Ind"] <- "Outlier"
data.temp[is.na(data.temp$Ind),"Ind"] <- "Inlier"
data.temp$Ind <- factor(data.temp$Ind)
ggplot(data = data.temp) + geom_point(aes(x = x, y = y, color=Ind, shape=Ind))



