library(crmPack)


### Name: update,Effloglog-method
### Title: Update method for the 'Effloglog' Model class. This is a method
###   to update the modal estimates of the model parameters theta_1
###   (theta1), theta_2 (theta2) and nu (nu, the precision of the efficacy
###   responses) when new data or new observations of responses are
###   available and added in.
### Aliases: update,Effloglog-method
### Keywords: methods

### ** Examples

##Update the 'Effloglog' model with new data
## first define the data and the model
emptydata<-DataDual(doseGrid=seq(25,300,25),placebo=FALSE)
data<-emptydata

Effmodel<-Effloglog(Eff=c(1.223,2.513),Effdose=c(25,300),nu=c(a=1,b=0.025),data=data,c=0)

##Then we have some new observations data
data<-DataDual(x=c(25,50,50,75,100,100,225,300),y=c(0,0,0,0,1,1,1,1),
               w=c(0.31,0.42,0.59,0.45,0.6,0.7,0.6,0.52),
               doseGrid=seq(25,300,25))

##update the model to get new estimates
newEffModel <- update(object=Effmodel,data=data)



