library(RHMS)


### Name: transform
### Title: Transforms a rainfall event to runoff
### Aliases: transform
### Keywords: array

### ** Examples


Area=200
lossMethod<-"SCS"
lossParams<-list(CN=65)
transformMethod<-c("snyder","SCS","user")
simulation<-c(interval=3600,period=100)
precipitation<-sin(seq(0.1,pi-0.1,length.out=10))*20
transformParams=list(Tlag=4,Cp=0.15,Ct=2,L=100,Lc=15)
UH<-data.frame(t=1:20,q=sin(seq(0,pi,length.out=20))*1)

SCS_loss<-loss(precipitation,lossParams,simulation,lossMethod)

snyder_transformation<-transform(rainfall=SCS_loss,
                                 transformParams,
                                 Area,
                                 simulation,
                                 transformMethod=transformMethod[1])
SCS_transformation<-transform(rainfall=SCS_loss,
                                 transformParams,
                                 Area,
                                 simulation,
                                 transformMethod=transformMethod[2])
user_transformation<-transform(rainfall=SCS_loss,
                                 transformParams,
                                 Area,
                                 simulation,
                                 UH,
                                 transformMethod=transformMethod[3])




