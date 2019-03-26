library(changepoint)


### Name: cpt.reg-class
### Title: Class "cpt.reg"
### Aliases: cpt.reg-class cpt.reg-method,cpts cpt.reg-method,cpttype
###   cpt.reg-method,data.set cpt.reg-method,test.stat
###   cpt.reg-method,method cpt.reg-method,ncpts.max
###   cpt.reg-method,param.est cpt.reg-method,pen.type
###   cpt.reg-method,pen.value cpt.reg-method,cpts<-
###   cpt.reg-method,cpttype<- cpt.reg-method,data.set<-
###   cpt.reg-method,test.stat<- cpt.reg-method,method<-
###   cpt.reg-method,ncpts.max<- cpt.reg-method,param.est<-
###   cpt.reg-method,pen.type<- cpt.reg-method,pen.value<-
###   cpt.reg-method,print cpt.reg-method,summary cpt.reg-method,param
### Keywords: classes cpt internal

### ** Examples

showClass("cpt.reg")

x=new("cpt.reg") # creates a new object with the cpt.reg class defaults
data.set(x)  # retrieves the data.set slot from x
data.set(x)<-matrix(1:10,nrow=5,ncol=2) # replaces the data.set slot from x with a matrix




