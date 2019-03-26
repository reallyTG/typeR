library(WRSS)


### Name: addObjectToArea
### Title: Adds a feature to area
### Aliases: addObjectToArea
### Keywords: list matrix

### ** Examples


#--------------------1st Example--------------------
Res<-createReservoir(name="res3",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),downstream =NA ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
D<-createDemandSite(name ="Agri5",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res),
                    priority=1)
R<-createRiver(name="river1",downstream=Res,discharge=rnorm(120,5,1.5))
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R)
area<-addObjectToArea(area,Res)
area<-addObjectToArea(area,D)
## Not run: 
##D plot(area)
##D simulated<-sim(area)
##D plot(simulated)
## End(Not run)


#--------------------2nd Example--------------------
Res<-createReservoir(name="res3",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
R<-createRiver(name="river1",downstream=Res,discharge=rnorm(120,5,1.5))
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
D1<-createDemandSite(name ="Agri1",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res),priority=1)
D2<-createDemandSite(name ="Agri2",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res),priority=1)
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R)
area<-addObjectToArea(area,Res)
area<-addObjectToArea(area,D1)
area<-addObjectToArea(area,D2)
## Not run: 
##D plot(area)
##D simulated<-sim(area)
##D plot(simulated)
## End(Not run)

#--------------------3rd Example--------------------
J1<-createJunction(name="j1")
Res1<-createReservoir(name="res1",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),downstream =J1 ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
Res2<-createReservoir(name="res2",type='storage',
                     priority=2,netEvaporation=rnorm(120,0.5,0.1),downstream =J1 ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
R1<-createRiver(name="river1",downstream=Res1,discharge=rnorm(120,5,1.5))
R2<-createRiver(name="river2",downstream=Res2,discharge=rnorm(120,5,1.5))
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
D1<-createDemandSite(name ="Agri1",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1),
                    downstream=J1,priority=1)
D2<-createDemandSite(name ="Agri2",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Res2),
                    downstream=J1,priority=2)
D3<-createDemandSite(name ="Agri3",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res2),
                    downstream=J1,priority=1)
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R1)
area<-addObjectToArea(area,R2)
area<-addObjectToArea(area,Res1)
area<-addObjectToArea(area,Res2)
area<-addObjectToArea(area,D1)
area<-addObjectToArea(area,D2)
area<-addObjectToArea(area,D3)
area<-addObjectToArea(area,J1)
## Not run: 
##D plot(area)
##D simulated<-sim(area)
##D plot(simulated)
## End(Not run)

#--------------------4th Example--------------------
J1<-createJunction(name="j1")
Res1<-createReservoir(name="res1",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),downstream =J1 ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
Auq1<-createAquifer(name="Aquifer1",area=100,volume=5000,
                    rechargeTS=rnorm(120,10,3),Sy=0.1,
                    leakageFraction=0.02,leakageObject=J1,priority=2)
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
R1<-createRiver(name="river1",downstream=Res1,discharge=rnorm(120,5,1.5))
R2<-createRiver(name="river2",downstream=Auq1,discharge=rnorm(120,5,1.5))
D1<-createDemandSite(name ="Agri1",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Auq1),
                    downstream=J1,priority=1)
D2<-createDemandSite(name ="Agri2",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Auq1),
                    downstream=J1,priority=2)
D3<-createDemandSite(name ="Agri3",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Auq1),
                    downstream=J1,priority=1)
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R1)
area<-addObjectToArea(area,R2)
area<-addObjectToArea(area,Res1)
area<-addObjectToArea(area,Auq1)
area<-addObjectToArea(area,D1)
area<-addObjectToArea(area,D2)
area<-addObjectToArea(area,D3)
area<-addObjectToArea(area,J1)
## Not run: 
##D plot(area)
##D simulated<-sim(area)
##D plot(simulated)
## End(Not run)

#--------------------5th Example--------------------
J1<-createJunction(name="junction1")
Res1<-createReservoir(name="res1",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
Auq1<-createAquifer(name="Aquifer1",area=100,volume=5000,
                    rechargeTS=rnorm(120,10,3),Sy=0.1,priority=2)
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
R1<-createRiver(name="River1",
                downstream=Res1,discharge=rnorm(120,20,3),
                seepageFraction=0.1,seepageObject=Auq1)
D1<-createDemandSite(name ="Agri1",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1),
                    downstream=J1,priority=1)
D2<-createDemandSite(name ="Agri2",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Auq1),
                    downstream=J1,priority=2)
D3<-createDemandSite(name ="Agri3",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(R1),
                    downstream=Res1,priority=2)
D4<-createDemandSite(name ="Agri4",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(R1),
                    downstream=Res1,priority=1)
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R1)
area<-addObjectToArea(area,Res1)
area<-addObjectToArea(area,Auq1)
area<-addObjectToArea(area,D1)
area<-addObjectToArea(area,D2)
area<-addObjectToArea(area,D3)
area<-addObjectToArea(area,D4)
area<-addObjectToArea(area,J1)
## Not run: 
##D plot(area)
##D simulated<-sim(area)
##D plot(simulated)
## End(Not run)


#--------------------6th Example--------------------
Auq1<-createAquifer(name="Aquifer1",area=100,volume=5000,
                    rechargeTS=rnorm(120,10,3),Sy=0.1)
waterVariation<-round(sin(seq(0,pi,length.out=12))*
                       100/sum(sin(seq(0,pi,length.out=12))))
D0<-createDemandSite(name ="Agri0",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Auq1),
                    priority=1)
Div1<-createDiversion(name="Div1",capacity=10,
                       divertObject=Auq1)
J2<-createJunction(name="junc2",downstream=Auq1)

Res2<-createReservoir(name="res2",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),downstream =J2 ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
R2<-createRiver(name="river2",downstream=Res2,discharge=rnorm(120,12,3))
D3<-createDemandSite(name ="Agri3",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res2),
                    downstream=J2,priority=2)
J1<-createJunction(name="junc1",downstream=Div1)
Res1<-createReservoir(name="res1",type='storage',
                     priority=1,netEvaporation=rnorm(120,0.5,0.1),downstream =J1 ,
                     geometry=list(deadStorage= 10 ,capacity= 90 ,
                     storageAreaTable= cbind(seq(0,90,10),seq(0,9,1))))
R1<-createRiver(name="river1",downstream=Res1,discharge=rnorm(120,5,1))
D2<-createDemandSite(name ="Agri2",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1,Res2),
                    downstream=J1,priority=2)
D1<-createDemandSite(name ="Agri1",
                    demandParams=list(waterUseRate=1,
                                      waterVariation=waterVariation,
                                      cropArea=1000),
                    returnFlowFraction =0.2,suppliers=list(Res1),
                    downstream=J1,priority=1)
area<-createArea(name="unknown",location="unknown",
                 simulation=list(start='2000-01-01',
                                 end  ='2000-04-29',
                                 interval='day'))
area<-addObjectToArea(area,R1)
area<-addObjectToArea(area,R2)
area<-addObjectToArea(area,Res1)
area<-addObjectToArea(area,Res2)
area<-addObjectToArea(area,D0)
area<-addObjectToArea(area,D1)
area<-addObjectToArea(area,D2)
area<-addObjectToArea(area,D3)
area<-addObjectToArea(area,Div1)
area<-addObjectToArea(area,Auq1)
area<-addObjectToArea(area,J1)
area<-addObjectToArea(area,J2)

simulated<-sim(area)
## Not run: 
##D plot(area)
##D plot(simulated)
## End(Not run)



