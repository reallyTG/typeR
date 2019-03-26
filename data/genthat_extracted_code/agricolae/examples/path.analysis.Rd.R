library(agricolae)


### Name: path.analysis
### Title: Path Analysis
### Aliases: path.analysis
### Keywords: multivariate

### ** Examples

# Path analysis. Multivarial Analysis. Anderson. Prentice Hall, pag 616
library(agricolae)
# Example 1
corr.x<- matrix(c(1,0.5,0.5,1),c(2,2))
corr.y<- rbind(0.6,0.7)
names<-c("X1","X2")
dimnames(corr.x)<-list(names,names)
dimnames(corr.y)<-list(names,"Y")
path.analysis(corr.x,corr.y)
# Example 2
# data of the progress of the disease related bacterial wilt to the ground
# for the component CE Ca K2 Cu
data(wilt)
data(soil)
x<-soil[,c(3,12,14,20)]
y<-wilt[,14]
cor.y<-correlation(y,x)$correlation
cor.x<-correlation(x)$correlation
path.analysis(cor.x,cor.y)




