library(genasis)


### Name: genplot
### Title: Plot of concentration time series
### Aliases: genplot
### Keywords: genplot

### ** Examples

## Definition of simple data sources:
c1<-c(0.386,0.256,0.182,0.254)
c2<-"fluorene"
c3<-c("2013-05-01","2013-06-03","2013-07-05","2013-08-07")
c4<-c("2013-05-08","2013-06-10","2013-07-12","2013-08-14")

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date","fluorene")

## Examples of different usages:
genplot(sample_openair,input="openair",pollutant="fluorene",distr="lnorm",
        n=10,ci="gradient",col="black",col.points="red",pch=15)
genplot(sample_genasis,input="genasis",n=10,col="blue")
genplot(c1,c3,ci=FALSE,pch=1,main="fluorene")

## Use of example data from the package:
data(kosetice.pas.openair)
genplot(kosetice.pas.openair[,1:8],col="orange",il="ts",ci=FALSE)
data(kosetice.pas.genasis)
## Not run: 
##D genplot(kosetice.pas.genasis[1:208,],input="genasis",
##D          distr="lnorm",ci="gradient",col="orange")
## End(Not run)



