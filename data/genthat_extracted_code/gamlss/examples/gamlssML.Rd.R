library(gamlss)


### Name: gamlssML
### Title: Maximum Likelihood estimation of a simple GAMLSS model
### Aliases: gamlssML gamlssMLpred
### Keywords: regression

### ** Examples

#-------- negative binomial 1000 observations
y<- rNBI(1000)
  system.time(m1<-gamlss(y~1, family=NBI))
  system.time(m1a<-gamlss(y~1, family=NBI, trace=FALSE))
system.time(m11<-gamlssML(y, family=NBI))
AIC(m1,m1a,m11, k=0)
# neg. binomial   n=10000
 y<- rNBI(10000)
 system.time(m1<-gamlss(y~1, family=NBI))
 system.time(m1a<-gamlss(y~1, family=NBI, trace=FALSE))
system.time(m11<-gamlssML(y, family=NBI))
AIC(m1,m1a,m11, k=0)
# binomial type data 
data(aep)
m1 <- gamlssML(aep$y, family=BB) # ok
m2 <- gamlssML(y, data=aep, family=BB) # ok
m3 <- gamlssML(y~1, data=aep, family=BB) # ok 
m4 <- gamlssML(aep$y~1, family=BB) # ok
AIC(m1,m2,m3,m4)
## Not run: 
##D #-----------------------------------------------------------
##D # neg. binomial   n=10000
##D y<- rNBI(10000)
##D rand <- sample(2, length(y), replace=TRUE, prob=c(0.6,0.4))
##D table(rand)
##D    Y <- subset(y, rand==1)
##D YVal <- subset(y, rand==2) 
##D length(Y)
##D length(YVal) 
##D da1 <- data.frame(y=y)
##D dim(da1)
##D da2 <- data.frame(y=Y)
##D dim(da2)
##D danew <- data.frame(y=YVal)
##D # using gamlssVGD to fit the models
##D g1 <- gamlssVGD(y~1, rand=rand, family=NBI, data=da1)
##D g2 <- gamlssVGD(y~1, family=NBI, data=da2, newdata=dan)
##D AIC(g1,g2)
##D VGD(g1,g2)
##D # using gamlssMLpred to fit the models
##D p1 <- gamlssMLpred(y, rand=rand, family=NBI)
##D p2 <- gamlssMLpred(Y, family=NBI, newdata=YVal)
##D # AIC and VGD should produce identical results
##D AIC(p1,p2,g1,g2)
##D VGD(p1,p2, g1,g2)
##D # the fitted residuals
##D wp(p1, ylim.all=1)
##D # the prediction residuals 
##D wp(resid=p1$residVal, ylim.all=.5)
##D #-------------------------------------------------------------
##D # chossing between distributions
##D p2<-gamlssMLpred(y, rand=rand, family=PO)
##D p3<-gamlssMLpred(y, rand=rand, family=PIG)
##D p4<-gamlssMLpred(y, rand=rand, family=BNB)
##D AIC(p1, p2, p3, p4)
##D VGD(p1, p2, p3, p4)
##D #--------------------------------------------------
## End(Not run)
 


