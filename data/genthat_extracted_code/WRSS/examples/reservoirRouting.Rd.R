library(WRSS)


### Name: reservoirRouting
### Title: base function for reservoir simulation
### Aliases: reservoirRouting
### Keywords: list matrix

### ** Examples

    type           <-c('storage','hydropower')
    demand         <-matrix(rnorm(480,10,3),120)
    priority       <-sample(1:3,4,replace=TRUE)
    inflow         <-rlnorm(120,log(50),log(4))
    netEvaporation <-rnorm(120,0.4,0.1)
    simulation     <-list(start='2000-01-01',end='2009-12-29',interval='month')
    seepageFraction<-0.05
    geometry       <-list(storageAreaTable=cbind(seq(0,100,10),seq(0,10,1)),
                          storageElevationTable=cbind(seq(0,100,10),seq(0,200,20)),
                          dischargeElevationTable=cbind(seq(0,50,10),seq(0,10,2)),
                          deadStorage=50,
                          capacity=100)
    plant          <-list(installedCapacity=50,
                          efficiency=cbind(c(5,25,45),c(0.5,0.9,0.7)),
                          designHead=c(100,200),
                          designFlow=c(10,40),
                          turbineAxisElevation=5,
                          submerged=TRUE,
                          loss=2)
    penstock       <-list(diameter=2,
                          length=50,
                          roughness=110)
    
    #-----Storage Reservoir----------
    reservoirRouting(type=type[1],
                     inflow=inflow,
                     netEvaporation=netEvaporation,
                     demand=demand,
                     priority=priority,
                     seepageFraction=seepageFraction,
                     geometry=geometry,
                     plant=plant,
                     penstock=penstock,
                     simulation=simulation)
## Not run: 
##D     ##-----Takes Several Minutes----------
##D 
##D     #-----Hydropower Reservoir with demand----------
##D     reservoirRouting(type=type[2],
##D                      inflow=inflow,
##D                      netEvaporation=netEvaporation,
##D                      demand=demand,
##D                      priority=priority,
##D                      seepageFraction=seepageFraction,
##D                      geometry=geometry,
##D                      plant=plant,
##D                      penstock=penstock,
##D                      simulation=simulation)
##D     #-----Hydropower Reservoir----------
##D     reservoirRouting(type=type[2],
##D                      inflow=inflow,
##D                      netEvaporation=netEvaporation,
##D                      priority=priority,
##D                      seepageFraction=seepageFraction,
##D                      geometry=geometry,
##D                      plant=plant,
##D                      penstock=penstock,
##D                      simulation=simulation)
##D     
##D   
## End(Not run)
  


