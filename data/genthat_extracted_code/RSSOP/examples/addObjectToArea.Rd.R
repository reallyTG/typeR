library(RSSOP)


### Name: addObjectToArea 
### Title: Adds An Object To The Area
### Aliases: addObjectToArea
### Keywords: models

### ** Examples

# Create an area
object<-createArea(name    ="Zarineh"  ,
                   location="kurdistan",
                   start   =c(1900,1)  ,
                   end     =c(1962,1))

# Create an Agricultural demand site
var<-sin(seq(0.2,pi-0.2,length.out=12))*100/sum(sin(seq(0.2,pi-0.2,length.out=12)))
dem<-createDemandSite(type="agricultural"       ,
                          demandName="Agri"     ,
                          demandCode=1          ,
                          annualUseRate=1.3084  ,
                          annualVariation=var   ,
                          area=1000             ,
                          cycle=TRUE            ,
                          numberOfCycles=62     ,
                          supplierCode=1        ,
                          downstreamCode=0      ,
                          priority=1)
# Create a Reservoir
AV<-data.frame(A=seq(2  ,30 ,length.out=10),
               V=seq(100,700,length.out=10))
res<-createReservoir(type                   ="storage",
                     name                   ="Bukan" ,
                     reservoirCode          =1        ,
                     downstreamReservoirCode=0        ,
                     geometry               =list(sMin      =100 ,
                                                  sMax      =700 ,
                                                  volumeArea=AV))

# Creat a meteorological object
met<-hydrometeorology(Inflow        =rlnorm(744,2,0.2),
                      netEvaporation=runif(744,0,0.2) ,
                      reservoirCode =1)
# add object to The area
object<-addObjectToArea(area  =object,
                        object=met   ,
                        type  ="hydrometeorology")
object<-addObjectToArea(area  =object,
                        object=dem   ,
                        type  ="demand")
object<-addObjectToArea(area  =object,
                        object=res   ,
                        type  ="reservoir")



