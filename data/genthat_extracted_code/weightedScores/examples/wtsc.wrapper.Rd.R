library(weightedScores)


### Name: wtsc.wrapper
### Title: THE WEIGHTED SCORES METHOD WITH INPUTS OF THE DATA
### Aliases: wtsc.wrapper wtsc.ord.wrapper
### Keywords: regression

### ** Examples


################################################################################
#                      read and set up the data set
################################################################################
data(childvisit)
# covariates
season1<-childvisit$q
season1[season1>1]<-0
xdat<-cbind(1,childvisit$sex,childvisit$age,childvisit$m,season1)
# response
ydat<-childvisit$hosp
#id
id<-childvisit$id
#time
tvec<-childvisit$q
################################################################################
out<-wtsc.wrapper(xdat,ydat,id,tvec,margmodel="nb1",corstr="ar",iprint=TRUE)
## Not run: 
##D ################################################################################
##D #                        transform to binary responses                         #
##D ################################################################################
##D y2<-ydat
##D y2[ydat>0]<-1
##D ################################################################################
##D out<-wtsc.wrapper(xdat,y2,id,tvec,margmodel="bernoulli",link="probit",
##D corstr="exch",iprint=TRUE)
##D ################################################################################
##D #                        via the code for ordinal                             #
##D ################################################################################
##D out<-wtsc.ord.wrapper(xdat[,-1],2-y2,id,tvec,link="probit",
##D corstr="exch",iprint=TRUE)
## End(Not run)



