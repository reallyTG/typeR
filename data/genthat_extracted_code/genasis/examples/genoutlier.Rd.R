library(genasis)


### Name: genoutlier
### Title: Identification and exclusion of outliers
### Aliases: genoutlier
### Keywords: genoutlier

### ** Examples

## Definition of simple data sources:
c1<-rnorm(100)+12
c2<-"random compound"
c3<-as.Date(as.Date("2013-01-01"):as.Date("2013-04-10"),
            origin="1970-01-01")
c4<-c3+1

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genoutlier(sample_openair,input="openair",pollutant="random compound",
           method="m2s")
genoutlier(sample_genasis,input="genasis",method="m3s")

## Use of example data from the package:
data(kosetice.pas.openair)
genoutlier(genpastoact(kosetice.pas.openair[,1:8]),method="lm3s",
           main="Outliers",ylab="Concentration ngm-3")
genoutlier(kosetice.pas.openair[,c(1:4,23:26)],col.points="orange",
           method="lm3s")
data(kosetice.pas.genasis)
genoutlier(kosetice.pas.genasis[625:832,],input="genasis",
           method="lm2s",sides=1)



