library(SNPmaxsel)


### Name: maxsel
### Title: Computes maximally selected chi-square statistics
### Aliases: maxsel
### Keywords: htest

### ** Examples

# load SNPmaxsel library
# library(SNPmaxsel)


x1<-sample(5,1000,replace=TRUE)
y<-sample(c(0,1),1000,replace=TRUE)

maxsel(x1=x1,y=y,type="ord")
maxsel(x1=x1,y=y,type="all.pairs")
maxsel(x1=x1,y=y,type="all.partitions")

x1<-sample(3,1000,replace=TRUE)
x2<-sample(3,1000,replace=TRUE)

maxsel(x1=x1,x2=x2,y=y,type="inter.ord")
maxsel(x1=x1,x2=x2,y=y,type="inter.cat")
maxsel(x1=x1,x2=x2,y=y,type="inter.ord.main")






