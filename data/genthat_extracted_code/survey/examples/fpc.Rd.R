library(survey)


### Name: fpc
### Title: Small survey example
### Aliases: fpc
### Keywords: datasets

### ** Examples

data(fpc)
fpc


withoutfpc<-svydesign(weights=~weight, ids=~psuid, strata=~stratid, variables=~x, 
   data=fpc, nest=TRUE)

withoutfpc
svymean(~x, withoutfpc)

withfpc<-svydesign(weights=~weight, ids=~psuid, strata=~stratid,
fpc=~Nh, variables=~x, data=fpc, nest=TRUE)

withfpc
svymean(~x, withfpc)

## Other equivalent forms 
withfpc<-svydesign(prob=~I(1/weight), ids=~psuid, strata=~stratid,
fpc=~Nh, variables=~x, data=fpc, nest=TRUE)

svymean(~x, withfpc)

withfpc<-svydesign(weights=~weight, ids=~psuid, strata=~stratid,
fpc=~I(nh/Nh), variables=~x, data=fpc, nest=TRUE)

svymean(~x, withfpc)

withfpc<-svydesign(weights=~weight, ids=~interaction(stratid,psuid),
strata=~stratid, fpc=~I(nh/Nh), variables=~x, data=fpc)

svymean(~x, withfpc)

withfpc<-svydesign(ids=~psuid, strata=~stratid, fpc=~Nh,
 variables=~x,data=fpc,nest=TRUE)

svymean(~x, withfpc)

withfpc<-svydesign(ids=~psuid, strata=~stratid,
fpc=~I(nh/Nh), variables=~x, data=fpc, nest=TRUE)

svymean(~x, withfpc)






