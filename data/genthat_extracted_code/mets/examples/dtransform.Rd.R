library(mets)


### Name: dtransform
### Title: Transform that allows condition
### Aliases: dtransform dtransform<- dtrans dtrans<-

### ** Examples

data(mena)

xx <- dtransform(mena,ll=log(agemena)+twinnum)

xx <- dtransform(mena,ll=log(agemena)+twinnum,agemena<15)
xx <- dtransform(xx  ,ll=100+agemena,ll2=1000,agemena>15)
dsummary(xx,ll+ll2~I(agemena>15))



