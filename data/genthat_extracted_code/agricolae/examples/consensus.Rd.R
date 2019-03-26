library(agricolae)


### Name: consensus
### Title: consensus of clusters
### Aliases: consensus
### Keywords: cluster

### ** Examples

library(agricolae)
data(pamCIP)
# only code
rownames(pamCIP)<-substr(rownames(pamCIP),1,6)
# par(cex=0.8)
output<-consensus( pamCIP,distance="binary", method="complete",nboot=5)
# Order consensus
Groups<-output$table.dend[,c(6,5)]
Groups<-Groups[order(Groups[,2],decreasing=TRUE),]
print(Groups)
## Identification of the codes with the numbers.
cbind(output$dendrogram$labels)
## To reproduce dendrogram
dend<-output$dendrogram
data<-output$table.dend
plot(dend)
text(data[,3],data[,4],data[,5])
# Other examples
# classical dendrogram
dend<-as.dendrogram(output$dendrogram)
plot(dend,type="r",edgePar = list(lty=1:2, col=2:1))
text(data[,3],data[,4],data[,5],col="blue",cex=1)
plot(dend,type="t",edgePar = list(lty=1:2, col=2:1))
text(data[,3],data[,4],data[,5],col="blue",cex=1)
## Without the control of duplicates
output<-consensus( pamCIP,duplicate=FALSE,nboot=5)
## using distance gower, require cluster package.
# output<-consensus( pamCIP,distance="gower", method="complete",nboot=5)



