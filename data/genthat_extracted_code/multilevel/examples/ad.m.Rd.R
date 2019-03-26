library(multilevel)


### Name: ad.m
### Title: Average deviation around mean or median
### Aliases: ad.m
### Keywords: attribute

### ** Examples

data(bhr2000)

#Examples for multiple item scales
AD.VAL<-ad.m(bhr2000[,2:12],bhr2000$GRP)
AD.VAL[1:5,]
summary(AD.VAL)
summary(ad.m(bhr2000[,2:12],bhr2000$GRP,type="median"))

#Example for single item measure
summary(ad.m(bhr2000$HRS,bhr2000$GRP))



