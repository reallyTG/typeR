library(gamlss.util)


### Name: garmaFit
### Title: A function to fit a GARMA model
### Aliases: garmaFit
### Keywords: models regression

### ** Examples

data(polio)
ti <- as.numeric(time(polio))
mo <- as.factor(cycle(polio))
x1 <- 0:167    #Index used in Tutz p197
x2 <- cos(2*pi*x1/12)
x3 <- sin(2*pi*x1/12)
x4 <- cos(2*pi*x1/6)
x5 <- sin(2*pi*x1/6)
# all the data here 
da <-data.frame(polio,x1,x2,x3,x4,x5, ti, mo)
rm(ti,mo,x1,x2,x3,x4,x5)

#-------------------------------------------------------------------
# with linear trend 
m00 <- garmaFit(polio~x1+x2+x3+x4+x5, data=da, order=c(0,0), family=NBI, tail=3) # 
m10 <- garmaFit(polio~x1+x2+x3+x4+x5, data=da, order=c(1,0), family=NBI, tail=3) # 

## Not run: 
##D m01 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(0,1), data=da, family=NBI, tail=3)
##D m20 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(2,0), data=da, family=NBI, tail=3)
##D m11 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(1,1), data=da, family=NBI, tail=3)
##D m02 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(0,2), data=da, family=NBI, tail=3)
##D m30 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(3,0), data=da, family=NBI, tail=3)
##D m21 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(2,1), data=da, family=NBI, tail=3)
##D m12 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(1,2), data=da, family=NBI, tail=3)
##D m03 <- garmaFit(polio~x1+x2+x3+x4+x5, order=c(0,3), data=da, family=NBI, tail=3)
##D AIC(m00,m10,m01,m20,m11,m02,m30,m21,m12,m03 , k=0)
##D AIC(m00,m10,m01,m20,m11,m02,m30,m21,m12,m03 , k=log(168))
##D # without linear trend 
##D n00 <- garmaFit(polio~x2+x3+x4+x5, data=da, order=c(0,0), family=NBI, tail=3) # 
##D n10 <- garmaFit(polio~x2+x3+x4+x5, data=da, order=c(1,0), family=NBI, tail=3) # OK
##D n01 <- garmaFit(polio~x2+x3+x4+x5, order=c(0,1), data=da, family=NBI, tail=3)
##D n20 <- garmaFit(polio~x2+x3+x4+x5, order=c(2,0), data=da, family=NBI, tail=3)
##D n11 <- garmaFit(polio~x2+x3+x4+x5, order=c(1,1), data=da, family=NBI, tail=3)
##D n02 <- garmaFit(polio~x2+x3+x4+x5, order=c(0,2), data=da, family=NBI, tail=3)
##D n30 <- garmaFit(polio~x2+x3+x4+x5, order=c(3,0), data=da, family=NBI, tail=3)
##D n21 <- garmaFit(polio~x2+x3+x4+x5, order=c(2,1), data=da, family=NBI, tail=3)
##D n12 <- garmaFit(polio~x2+x3+x4+x5, order=c(1,2), data=da, family=NBI, tail=3)
##D n03 <- garmaFit(polio~x2+x3+x4+x5, order=c(0,3), data=da, family=NBI, tail=3)
##D 
##D AIC(m00,n10,n01,n20,n11,n02,n30,n21,n12,  k=0)
##D AIC(m00,n10,n01,n20,n11,n02,n30,n21,n12, k=log(168))
## End(Not run)



