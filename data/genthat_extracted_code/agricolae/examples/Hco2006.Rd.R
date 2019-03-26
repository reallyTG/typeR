library(agricolae)


### Name: Hco2006
### Title: Data amendment Huanuco 2006
### Aliases: Hco2006
### Keywords: datasets

### ** Examples

library(agricolae)
data(Hco2006)
str(Hco2006)
wilt<-Hco2006$wilt
yield<-Hco2006$yield
means <- tapply.stat(wilt[,5],wilt[,1:3],function(x) mean(x,na.rm=TRUE))
names(means)[4]<-"wilt_percent"
model <- aov(wilt_percent ~ block + crop, means)
anova(model)
cv.model(model)
yield<-yield[order(paste(yield[,1],yield[,2],yield[,3])),]
correlation(means[,4],yield[,4],method="spearman")



