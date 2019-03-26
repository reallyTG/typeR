library(RHMS)


### Name: addObjectToBasin
### Title: adds an object to basin
### Aliases: addObjectToBasin
### Keywords: iteration

### ** Examples


Junc1<-createJunction(name = "Junc1", downstream=6, 
                      label=5, inflow = NA, delayInflow = 1)
R1<-createReach(name="Reach1",label=3,downstream=5,
                routingParams=list(k=3,x=0.2))
R2<-createReach(name="Reach2",label=4,downstream=5,
                routingParams=list(k=3,x=0.2))
R3<-createReach(name="Reach3",label=6,downstream=7,
                routingMethod="muskingumcunge",
                routingParams=list(bedWith=100,
                                   sideSlope=2,
                                   channelSlope=0.01,
                                   manningRoughness=0.05,
                                   riverLength=120))
S1<-createSubbasin(name="Sub1",Area=500,label=1,downstream=8,
                   precipitation=round(sin(seq(0,pi,length.out=24))*20),
                   transformMethod="SCS",lossMethod="SCS",BFSMethod='recession',
                   transformParams=list(Tlag=4),lossParams=list(CN=70),BFSParams=list(k=1.1))
S2<-createSubbasin(name="Sub2",Area=650,label=2,downstream=4,
                   precipitation=round(sin(seq(0,pi,length.out=24))*20),
                   transformMethod="snyder",lossMethod="horton",
                   transformParams=list(Cp=0.17,Ct=1.5,L=140,Lc=30),
                   lossParams=list(f0=5,f1=1,k=1))
D1<-createDiversion(name="Diversion1",label=8,downstream=3,
                    divertTo=7,capacity=80)
ratingCurve1<-data.frame(s=0:100*10,h=100:200)
dischargeCurve1<-data.frame(q=seq(0,5000,length.out=10),h=seq(180,200,length.out=10))
Res1<-createReservoir(name = "Reservoir1", inflow = NA, ratingCurve=ratingCurve1, 
                      dischargeCurve=dischargeCurve1, initialStorage=800,
                      capacity=800, delayInflow = 1, label=7, downstream = NA)

basin1<-createBasin(name = "Ghezil_Ozan", simPeriod=200, interval=3600)

basin1<-addObjectToBasin(Junc1, basin1)
basin1<-addObjectToBasin(R1, basin1)
basin1<-addObjectToBasin(R2, basin1)
basin1<-addObjectToBasin(R3, basin1)
basin1<-addObjectToBasin(S1, basin1)
basin1<-addObjectToBasin(S2, basin1)
basin1<-addObjectToBasin(Res1, basin1)
basin1<-addObjectToBasin(D1, basin1)

## Not run: plot(basin1)

object<-sim(basin1)

## Not run: plot(object)

summary(object)



