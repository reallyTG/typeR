library(HighDimOut)


### Name: Func.FBOD
### Title: Feature-bagging outlier detection (FBOD) algorithm
### Aliases: Func.FBOD

### ** Examples

library(ggplot2)
res.FBOD <- Func.FBOD(data = TestData[,1:2], iter=10, k.nn=5)
data.temp <- TestData[,1:2]
data.temp$Ind <- NA
data.temp[order(res.FBOD, decreasing = TRUE)[1:10],"Ind"] <- "Outlier"
data.temp[is.na(data.temp$Ind),"Ind"] <- "Inlier"
data.temp$Ind <- factor(data.temp$Ind)
ggplot(data = data.temp) + geom_point(aes(x = x, y = y, color=Ind, shape=Ind))



