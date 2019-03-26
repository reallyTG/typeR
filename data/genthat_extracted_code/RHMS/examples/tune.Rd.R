library(RHMS)


### Name: tune
### Title: tunning an RHMS model
### Aliases: tune
### Keywords: optimize

### ** Examples


S1<-createSubbasin(name = "S1", 
                   precipitation=sin(seq(0,pi,length.out=20))*40,
                   Area=100,label=1, downstream=3,
                   transformMethod="SCS",lossMethod="SCS",
                   transformParams=list(Tlag=4),lossParams=list(CN=60))
S2<-createSubbasin(name = "S2", 
                   precipitation=sin(seq(0,pi,length.out=20))*30,
                   Area=300,label=2, downstream=4,
                   transformMethod="snyder",lossMethod="horton",
                   transformParams=list(Cp=0.17,Ct=2,L=30,Lc=15),
                   lossParams=list(f0=10,f1=4,k=1))

R1<-createReach(name="R1",routingMethod="muskingum",
                routingParams=list(k=3,x=0.2),
                label=3,downstream=5)
R2<-createReach(name="R2",routingMethod="muskingumcunge",
                routingParams=list(bedWith=50,
                                   sideSlope=2,
                                   channelSlope=0.0005,
                                   manningRoughness=0.025,
                                   riverLength=100),
                label=4,downstream=5)
J1<-createJunction (name="J1",downstream=NA,label=5)

basin1<-createBasin(name = "Ghezil_Ozan", simPeriod=100, interval=3600)
basin1<-addObjectToBasin(S1, basin1)
basin1<-addObjectToBasin(S2, basin1)
basin1<-addObjectToBasin(R1, basin1)
basin1<-addObjectToBasin(R2, basin1)
basin1<-addObjectToBasin(J1, basin1)

## Not run: 
##D plot(basin1)
## End(Not run)

simulated<-sim(basin1)

observationTS1<-simulated$operation$junctions[[1]]$outflow
set.seed(1)
observationTS1<-observationTS1+rnorm(length(observationTS1),0,200)
y<-observationTS1; x<-1:length(observationTS1)
observationTS1<-predict(loess(y~x),x)
observationTS1[which(observationTS1<0)]<-0
observationTS<-observationTS1

maxiter <- 20
transformBandWith=list(ct=c(1  ,2.5),
                       cp=c(0.1,0.3),
                       cn=c(25 ,85) ,
                       k =c(0.1,2))
routingBandWith=list(maning = c(0.0001,0.1), 
                     x      = c(0.2   ,0.6),
                     k      = c(1     ,5))
labelTS<-5 ; tuneLabels<-1:4
## Not run: 
##D tune(object=basin1, 
##D      labelTS=labelTS,
##D      maxiter=maxiter,
##D      tuneLabels=tuneLabels,
##D      observationTS=observationTS,
##D      routingBandWith=routingBandWith,
##D      transformBandWith=transformBandWith)
## End(Not run)



