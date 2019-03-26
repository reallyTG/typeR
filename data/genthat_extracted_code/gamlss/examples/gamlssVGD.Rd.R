library(gamlss)


### Name: gamlssVGD
### Title: A Set of Functions for selecting Models using Validation or Test
###   Data Sets and Cross Validation
### Aliases: gamlssVGD VGD getTGD TGD gamlssCV CV drop1TGD add1TGD stepTGD
###   stepTGDAll.A
### Keywords: regression

### ** Examples

data(abdom)
# generate the random split of the data
rand <- sample(2, 610, replace=TRUE, prob=c(0.6,0.4))
# the proportions in the sample
table(rand)/610
olddata<-abdom[rand==1,] # training data
newdata<-abdom[rand==2,] # validation data
#------------------------------------------------------------------------------
#  gamlssVGD
#-------------------------------------------------------------------------------
# Using rand
v1 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=NO, 
              rand=rand)
v2 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=LO, 
              rand=rand)
v3 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=TF, 
              rand=rand)
VGD(v1,v2,v3)
#-------------------------------------------------------------------------------
## Not run: 
##D #-------------------------------------------------------------------------------
##D # using two data set
##D v11 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, 
##D                   family=NO, newdata=newdata)
##D v12 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, 
##D                  family=LO, newdata=newdata)
##D v13 <- gamlssVGD(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, 
##D                  family=TF, newdata=newdata)
##D VGD(v11,v12,v13)
##D #-------------------------------------------------------------------------------
##D # function getTGD
##D #-------------------------------------------------------------------------------
##D # fit gamlss models first
##D g1 <- gamlss(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, family=NO)
##D g2 <- gamlss(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, family=LO)
##D g3 <- gamlss(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=olddata, family=TF)
##D # and then use 
##D gg1 <-getTGD(g1, newdata=newdata)
##D gg2 <-getTGD(g2, newdata=newdata)
##D gg3 <-getTGD(g3, newdata=newdata)
##D 
##D TGD(gg1,gg2,gg3)
##D #-------------------------------------------------------------------------------
##D #-------------------------------------------------------------------------------
##D # function gamlssCV
##D #-------------------------------------------------------------------------------
##D set.seed(123)
##D rand1 <- sample (10 , 610, replace=TRUE)
##D g1 <- gamlssCV(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=NO, 
##D                rand=rand1)
##D g2 <- gamlssCV(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=LO, 
##D                rand=rand1)
##D g3 <- gamlssCV(y~pb(x,df=2),sigma.formula=~pb(x,df=1), data=abdom, family=TF, 
##D                rand=rand1)
##D CV(g1,g2,g3)
##D CV(g1)
##D # using parallel 
##D set.seed(123)
##D rand1 <- sample (10 , 610, replace=TRUE)
##D nC <- detectCores()
##D 
##D system.time(g21 <- gamlssCV(y~pb(x,df=2), sigma.formula=~pb(x,df=1), data=abdom,
##D              family=NO, rand=rand1,parallel = "no", ncpus = nC ))
##D 
##D system.time(g22 <- gamlssCV(y~pb(x,df=2), sigma.formula=~pb(x,df=1), data=abdom,
##D              family=LO, rand=rand1,parallel = "multicore", ncpus = nC ))
##D 
##D system.time(g23 <- gamlssCV(y~pb(x,df=2), sigma.formula=~pb(x,df=1), data=abdom,
##D              family=TF, rand=rand1,parallel = "snow", ncpus = nC ))
##D 
##D 
##D CV(g21,g22,g23)
##D #-------------------------------------------------------------------------------
##D # functions add1TGD() drop1TGD() and stepTGD()
##D #-------------------------------------------------------------------------------
##D # the data
##D data(rent)
##D rand <- sample(2, dim(rent)[1], replace=TRUE, prob=c(0.6,0.4))
##D # the proportions in the sample
##D table(rand)/dim(rent)[1]
##D oldrent<-rent[rand==1,] # training set
##D newrent<-rent[rand==2,] # validation set
##D 
##D # null model
##D v0 <- gamlss(R~1, data=oldrent, family=GA)
##D # complete model
##D v1 <- gamlss(R~pb(Fl)+pb(A)+H+loc, sigma.fo=~pb(Fl)+pb(A)+H+loc, 
##D              data=oldrent, family=GA)
##D 
##D # drop1TGDP
##D system.time(v3<- drop1TGD(v1, newdata=newrent,  parallel="no"))
##D system.time(v4<- drop1TGD(v1, newdata=newrent,  parallel="multicore", 
##D                           ncpus=nC) )
##D system.time(v5<- drop1TGD(v1, newdata=newrent,  parallel="snow", ncpus=nC))
##D cbind(v3,v4,v5)
##D 
##D # add1TGDP
##D system.time(d3<- add1TGD(v0,scope=~pb(Fl)+pb(A)+H+loc, newdata=newrent,  
##D                        parallel="no"))
##D system.time(d4<- add1TGD(v0,scope=~pb(Fl)+pb(A)+H+loc, newdata=newrent,  
##D                         parallel="multicore", ncpus=nC) )
##D system.time(d5<- add1TGD(v0, scope=~pb(Fl)+pb(A)+H+loc,newdata=newrent,  
##D                         parallel="snow", ncpus=nC))
##D 
##D # stepTGD
##D system.time(d6<- stepTGD(v0, scope=~pb(Fl)+pb(A)+H+loc,newdata=newrent))
##D system.time(d7<- stepTGD(v0, scope=~pb(Fl)+pb(A)+H+loc,newdata=newrent,
##D                          parallel="multicore", ncpus=nC))
##D system.time(d8<- stepTGD(v0, scope=~pb(Fl)+pb(A)+H+loc,newdata=newrent,
##D                          parallel="snow", ncpus=nC))
## End(Not run)



