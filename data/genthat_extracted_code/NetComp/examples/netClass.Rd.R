library(NetComp)


### Name: netClass
### Title: Network from Class List
### Aliases: netClass

### ** Examples

 #using the USArrest dataset
 arrestCor<-cor(t(USArrests))
 tree<-cutree(hclust(as.dist(1-arrestCor), method='ward'), k=10)
 netClass(tree, labels=colnames(arrestCor))
 



