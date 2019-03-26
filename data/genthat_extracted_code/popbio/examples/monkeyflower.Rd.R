library(popbio)


### Name: monkeyflower
### Title: Projection matrices for monkeyflower
### Aliases: monkeyflower
### Keywords: datasets

### ** Examples

data(monkeyflower)
## convert M. cardinalis rows to list of 16 matrices
A <- subset(monkeyflower, species=="cardinalis")
# use as.matrix to convert data.frame to numeric matrix
A<-split( as.matrix(A[, 4:19]),  paste(A$site, A$year))
stages<-c("seed", "sm.nr", "lg.nr", "repro")
## convert to list of 16 matrices
A<-lapply(A, matrix, nrow=4, byrow=TRUE, dimnames=list(stages,stages))
A[8]
image2(A[[8]], round=8, mar=c(1,3,4.5,1))
title( paste("M. cardinalis - ", names(A[8])), line=2.5)


## plot like figure 1A
x<- matrix(sapply(A, lambda), ncol=4)
colnames(x)<-c("BU",  "CA", "RP", "WA")
rownames(x)<-c(2000:2002, "pooled")
x<-x[,c(1,3,4,2)]
colrs<-gray(0:3 / 3)[c(1,3,2,4)]
barplot(x, beside=TRUE, las=1, col=colrs, ylim=c(0,2),
ylab="Population growth rate", main="Mimulus cardinalis")
box()
abline(h=1, lwd=.5)
legend(1,1.95, rownames(x), fill=colrs, bty='n')




