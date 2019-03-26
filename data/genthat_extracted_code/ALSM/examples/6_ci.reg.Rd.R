library(ALSM)


### Name: ci.reg
### Title: Estimation and confidence interval of Mean Response and
###   Prediction of New Observation in regression model
### Aliases: ci.reg

### ** Examples


#### problem 6.14.a page 250
d<-data.frame(282000,7.1,0)
ci.reg(lm(y~x1+x2+x3,GroceryRetailer),d,type='nm',m=3)

#### problem 6.13.b page 250
d<-data.frame(c(230000,250000,280000,340000),c(7.5,7.3,7.1,6.9),c(0,0,0,0))
ci.reg(lm(y~x1+x2+x3,GroceryRetailer),d,type='gn')

#### problem 6.12.a page 250
d<-data.frame(c(302000,245000,280000,350000,295000),c(7.2,7.4,6.9,7,6.7),c(0,0,0,0,1))
ci.reg(lm(y~x1+x2+x3,GroceryRetailer),d,type='b')

### example page 158
d<-data.frame(c(30,65,100))
ci.reg(lm(y~x,TolucaCompany),d,type='w',alpha=.1)

### example page 54
d<-data.frame(65)
ci.reg(lm(y~x,TolucaCompany),d,type='m',alpha=.1)

### example page 59
d<-data.frame(100)
ci.reg(lm(y~x,TolucaCompany),d,type='n',alpha=.1)







