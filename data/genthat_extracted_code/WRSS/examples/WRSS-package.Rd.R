library(WRSS)


### Name: WRSS-package
### Title: Water Resources System Simulator
### Aliases: WRSS-package WRSS
### Keywords: package

### ** Examples

###---------- loading data
data(zarrineh)

###---------- Constructing main features of Zerrineh river basin
Area<-createArea(name='Zerrineh',location='Kurdistan',
                 simulation=list(start='1900-01-01',
                                 end='1909-12-01',
                                 interval='month'))

   ###---------- Bukan dam
Q<-zarrineh$bukan$timeSeries[,1]
E<-zarrineh$bukan$timeSeries[,2]
R<-zarrineh$bukan$timeSeries[,3]
D<-zarrineh$bukan$timeSeries[,4]
A<-zarrineh$bukan$timeSeries[,5]
RC<-zarrineh$bukan$ratingCurve
min<-zarrineh$bukan$capacity[1]$min
max<-zarrineh$bukan$capacity[2]$max
bukan<-createReservoir(name='bukan',netEvaporation=E,
                       initialStorage=max, 
                       geometry=list(deadStorage=min,
                                     capacity=max,
                                     storageAreaTable=RC))
Zerrineh<-createRiver(name='Zerrineh-River',downstream=bukan,discharge=Q)
R<-createDemandSite(name='E1',demandTS=R,suppliers=list(bukan),priority=1)
D<-createDemandSite(name='U1',demandTS=D,suppliers=list(bukan),priority=2)
A<-createDemandSite(name='A1',demandTS=A,suppliers=list(bukan),priority=3)
Area<-addObjectToArea(Area,Zerrineh)
Area<-addObjectToArea(Area,bukan)
Area<-addObjectToArea(Area,R)
Area<-addObjectToArea(Area,D)
Area<-addObjectToArea(Area,A)

   ###---------- a junction located in Bukan dam upstream
J<-createJunction(name='J1', downstream=Zerrineh)
Area<-addObjectToArea(Area,J)

   ###---------- Markhuz dam
Q<-zarrineh$Markhuz$timeSeries[,1]
E<-zarrineh$Markhuz$timeSeries[,2]
A<-zarrineh$Markhuz$timeSeries[,3]
RC<-zarrineh$Markhuz$ratingCurve
min<-zarrineh$Markhuz$capacity[1]$min
max<-zarrineh$Markhuz$capacity[2]$max
Markhuz<-createReservoir(name='Markhuz',netEvaporation=E,
                         downstream=J,initialStorage=max,
                         geometry=list(deadStorage=min,
                         capacity=max,
                         storageAreaTable=RC))
River<-createRiver(name='Markhuz-River',downstream=Markhuz,discharge=Q)
A<-createDemandSite(name='A3',demandTS=A,returnFlowFraction=0.3,
                    suppliers=list(Markhuz),downstream=J,priority=1)
Area<-addObjectToArea(Area, River)
Area<-addObjectToArea(Area, Markhuz)
Area<-addObjectToArea(Area, A)

   ###---------- Cheragh Veys dam
Q<-zarrineh$cheraghVeys$timeSeries[,1]
E<-zarrineh$cheraghVeys$timeSeries[,2]
R<-zarrineh$cheraghVeys$timeSeries[,3]
D<-zarrineh$cheraghVeys$timeSeries[,4]
A<-zarrineh$cheraghVeys$timeSeries[,5]
RC<-zarrineh$cheraghVeys$ratingCurve
min<-zarrineh$cheraghVeys$capacity[1]$min
max<-zarrineh$cheraghVeys$capacity[2]$max
cheraghVeys<-createReservoir(name='cheraghVeys',netEvaporation=E,
                             downstream=J,initialStorage=max,
                             geometry=list(deadStorage=min,
                                           capacity=max,
                                           storageAreaTable=RC))
River<-createRiver(name='Cheragh Veys-River',downstream=cheraghVeys,discharge=Q)
R<-createDemandSite(name='E2',demandTS=R,returnFlowFraction=1.0,
                    suppliers=list(cheraghVeys),downstream=J,priority=1)
D<-createDemandSite(name='U2',demandTS=D,returnFlowFraction=0.7,
                    suppliers=list(cheraghVeys),downstream=J,priority=2)
                    A<-createDemandSite(name='A2',demandTS=A,returnFlowFraction=0.3,
suppliers=list(cheraghVeys),downstream=J,priority=3)
Area<-addObjectToArea(Area, River)
Area<-addObjectToArea(Area, cheraghVeys)
Area<-addObjectToArea(Area, R)
Area<-addObjectToArea(Area, D)
Area<-addObjectToArea(Area, A)

   ###---------- Sonata dam
Q<-zarrineh$Sonata$timeSeries[,1]
E<-zarrineh$Sonata$timeSeries[,2]
R<-zarrineh$Sonata$timeSeries[,3]
A<-zarrineh$Sonata$timeSeries[,4]
RC<-zarrineh$Sonata$ratingCurve
min<-zarrineh$Sonata$capacity[1]$min
max<-zarrineh$Sonata$capacity[2]$max
Sonata<-createReservoir(name='Sonata',netEvaporation=E,downstream=J,
                        initialStorage=max,
                        geometry=list(deadStorage=min,
                                      capacity=max,
                                      storageAreaTable=RC))
River<-createRiver(name='Sonata-River',downstream=Sonata,discharge=Q)
R<-createDemandSite(name='E3',demandTS=R,returnFlowFraction=1.0,
                    suppliers=list(Sonata),downstream=J,priority=1)
A<-createDemandSite(name='A4',demandTS=A,returnFlowFraction=0.3,
                    suppliers=list(Sonata),downstream=J,priority=2)
Area<-addObjectToArea(Area, River)
Area<-addObjectToArea(Area, Sonata)
Area<-addObjectToArea(Area, R)
Area<-addObjectToArea(Area, A)

   ###---------- Sarogh dam
Q<-zarrineh$Sarogh$timeSeries[,1]
E<-zarrineh$Sarogh$timeSeries[,2]
D<-zarrineh$Sarogh$timeSeries[,3]
A<-zarrineh$Sarogh$timeSeries[,4]
RC<-zarrineh$Sarogh$ratingCurve
min<-zarrineh$Sarogh$capacity[1]$min
max<-zarrineh$Sarogh$capacity[2]$max
Sarogh<-createReservoir(name='Sarogh',netEvaporation=E,downstream=J,
                        initialStorage=max,
                        geometry=list(deadStorage=min,
                                      capacity=max,
                                      storageAreaTable=RC))
River<-createRiver(name='Sarogh-River',downstream=Sarogh,discharge=Q)
D<-createDemandSite(name='U3',demandTS=D,returnFlowFraction=0.7,
                    suppliers=list(Sarogh),downstream=J,priority=1)
                    A<-createDemandSite(name='A5',demandTS=A,returnFlowFraction=0.3,
suppliers=list(Sarogh),downstream=J,priority=2)
Area<-addObjectToArea(Area, River)
Area<-addObjectToArea(Area, Sarogh)
Area<-addObjectToArea(Area, D)
Area<-addObjectToArea(Area, A)
## Not run: 
##D plot(Area)
## End(Not run)
plot(sim(Area))



