library(G1DBN)


### Name: arth800line
### Title: Arabidopsis Thaliana temporal gene expression data
### Aliases: arth800line
### Keywords: datasets

### ** Examples

## load G1DBN library
library(G1DBN)

## load data set
data(arth800line)
id<-c(60, 141, 260, 333, 365, 424, 441, 512, 521, 578, 789, 799)

## plot first ten time series
plot(1:23,arth800line[,60],type="l",ylim=c(2,12), xlab="Time",
 ylab="Log2 transformed expression",lwd=2,
 main="Log2 transformed expression of a subset of genes of A. Thaliana")

color=1
for (i in id){
  color=color+1
  lines(1:23,arth800line[,i,],col=color,lwd=2)
}




