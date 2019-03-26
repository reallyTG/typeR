library(agricolae)


### Name: hcut
### Title: Cut tree of consensus
### Aliases: hcut
### Keywords: cluster

### ** Examples

library(agricolae)
data(pamCIP)
# only code
rownames(pamCIP)<-substr(rownames(pamCIP),1,6)
# groups of clusters
# output<-consensus(pamCIP,nboot=100)
# hcut(output,h=0.4,group=5,main="Group 5")
# 
# hcut(output,h=0.4,group=8,type="t",edgePar=list(lty=1:2,col=2:1),main="group 8"
# ,col.text="blue",cex.text=1)



