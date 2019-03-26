library(HighDimOut)


### Name: Func.ABOD
### Title: Angle-based outlier detection (ABOD) algorithm
### Aliases: Func.ABOD

### ** Examples

library(ggplot2)
res.ABOD <- Func.ABOD(data=TestData[,1:2], basic=FALSE, perc=0.2)
data.temp <- TestData[,1:2]
data.temp$Ind <- NA
data.temp[order(res.ABOD, decreasing = FALSE)[1:10],"Ind"] <- "Outlier"
data.temp[is.na(data.temp$Ind),"Ind"] <- "Inlier"
data.temp$Ind <- factor(data.temp$Ind)
ggplot(data = data.temp) + geom_point(aes(x = x, y = y, color=Ind, shape=Ind))



