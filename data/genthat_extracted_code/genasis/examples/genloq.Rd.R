library(genasis)


### Name: genloq
### Title: Substitution of (concentration) values below a limit of
###   quantification (LoQ)
### Aliases: genloq
### Keywords: genloq

### ** Examples

## Definition of simple data sources:
c1<-rlnorm(100,0,1)
c2<-"random compound"
c3<-as.Date(as.Date("2013-01-01"):as.Date("2013-04-10"),
            origin="1970-01-01")
c4<-c3+1

# Cuts the values below the 0.5.
c1[which(c1<0.5)]<-"LoQ"

sample_genasis<-data.frame(c1,c2,c3,c4)
sample_openair<-data.frame(c4,c1)
colnames(sample_openair)=c("date",c2)

## Examples of different usages:
genloq(c1,c3,pollutant=c2,method="sq2")
genloq(sample_openair,method="mle")



