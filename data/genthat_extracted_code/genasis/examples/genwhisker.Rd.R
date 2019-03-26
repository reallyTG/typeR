library(genasis)


### Name: genwhisker
### Title: Box and whisker plot - overview of dataset
### Aliases: genwhisker
### Keywords: genwhisker

### ** Examples

## Definition of simple data sources:
c1<-c(0.386,0.269,0.182,0.254,0.455,0.263,0.405,0.211)
c2<-"benzo(ghi)perylene"
c3<-c("2012-02-01","2012-05-03","2012-08-05","2012-11-07",
      "2013-02-15","2013-05-10","2013-08-02","2013-11-06")
c4<-c("2012-02-08","2012-05-10","2012-08-12","2012-11-14",
      "2013-02-22","2013-05-17","2013-08-09","2013-11-13")

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genwhisker(sample_openair,distr="lnorm",col="black")
genwhisker(sample_genasis,input="genasis",distr="norm",by.years=TRUE,
           col=c("blue","red"),legend=TRUE,main="benzo(ghi)perylene")
genwhisker(c1,c3,main="benzo(ghi)perylene")

## Use of example data from the package:
data(kosetice.pas.openair)
genwhisker(kosetice.pas.openair[,1:8],
           col=c("gold","orange","red","black"),by.years=TRUE)
data(kosetice.pas.genasis)
genwhisker(kosetice.pas.genasis[1:208,],input="genasis",distr="lnorm",
           col="orange")



