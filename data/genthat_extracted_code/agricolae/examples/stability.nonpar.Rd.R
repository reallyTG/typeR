library(agricolae)


### Name: stability.nonpar
### Title: Nonparametric stability analysis
### Aliases: stability.nonpar
### Keywords: nonparametric

### ** Examples

library(agricolae)
data(haynes)
stability.nonpar(haynes,"AUDPC",ranking=TRUE,console=TRUE)
# Example 2
data(CIC)
data1<-CIC$comas[,c(1,6,7,17,18)]
data2<-CIC$oxapampa[,c(1,6,7,19,20)]
cic <- rbind(data1,data2)

means <- by(cic[,5], cic[,c(2,1)], function(x) mean(x,na.rm=TRUE))
means <-as.data.frame(means[,])
cic.mean<-data.frame(genotype=row.names(means),means)
cic.mean<-delete.na(cic.mean,"greater")
out<-stability.nonpar(cic.mean)
out$ranking
out$statistics



