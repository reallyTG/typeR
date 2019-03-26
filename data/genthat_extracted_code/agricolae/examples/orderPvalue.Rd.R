library(agricolae)


### Name: orderPvalue
### Title: Grouping the treatments averages in a comparison with a minimum
###   value
### Aliases: orderPvalue
### Keywords: manip

### ** Examples

library(agricolae)
treatments <- c("A","B","C")
means<-c(2,5,3)
alpha <- 0.05
pvalue<-matrix(1,nrow=3,ncol=3)
pvalue[1,2]<-pvalue[2,1]<-0.03
pvalue[1,3]<-pvalue[3,1]<-0.10
pvalue[2,3]<-pvalue[3,2]<-0.06
out<-orderPvalue(treatments,means,alpha,pvalue,console=TRUE)
barplot(out[,1],names.arg = row.names(out),col=colors()[84:87])
legend("topright",as.character(out$groups),pch=15,col=colors()[84:87],box.col=0)



