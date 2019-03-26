library(SNPmaxsel)


### Name: maxsel.asymp.test
### Title: Test of independence based on maximally selected statistics
### Aliases: maxsel.asymp.test
### Keywords: htest

### ** Examples

# load SNPmaxsel library
# library(SNPmaxsel)

x1<-sample(5,1000,replace=TRUE)
y<-sample(c(0,1),1000,replace=TRUE)

maxsel.asymp.test(x1=x1,y=y,type="ord")
maxsel.asymp.test(x1=x1,y=y,type="all.pairs")
maxsel.asymp.test(x1=x1,y=y,type="all.partitions")

x1<-sample(3,1000,replace=TRUE)
x2<-sample(3,1000,replace=TRUE)

maxsel.asymp.test(x1=x1,x2=x2,y=y,type="inter.ord")
maxsel.asymp.test(x1=x1,x2=x2,y=y,type="inter.cat")
maxsel.asymp.test(x1=x1,x2=x2,y=y,type="inter.ord.main")






