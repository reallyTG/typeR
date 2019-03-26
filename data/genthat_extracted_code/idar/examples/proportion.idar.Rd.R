library(idar)


### Name: proportion.idar
### Title: Determine the Proportion of Accumulator and Repeller Species
### Aliases: proportion.idar plot.pidar
### Keywords: spatial

### ** Examples


# Compute percentage of accumulator, neutral an repeller species (for ISAR) in Lansing woods
# In this example, against a null model of IPP.
data(lansing)

# Compute rISAR and plot envelopes for an inhomogeneous Poisson model
# of each species in San Francisco plot
# Split sfsp point pattern ppp by species
lansing.sp<- split(lansing)

# Set parameters for the simulations, estimation of intensity surface for IPP, etc.
# BEWARE: THIS is for R-TESTING ALONE. REAL TESTS SHOULD EMPLOY 199 simulations or higher
nsim<-8
r<- seq(0.01,0.25, by=0.01)
# Create list to store the results
isar.lansing<- list()
# start computation

for( i in 1: length(lansing.sp)){
   print(i)
   # estimate intensity of the focal species
   lambda<- density(lansing.sp[[i]])
   # obtain simulated patterns were all species except the focal remain fixed
   # and the focal varies according to an inhomomgeneous Poiisson process
   simulados<- multifocalsimulator(lansing, mimark=levels(lansing$marks)[i],
                            simulate=expression(rpoispp(lambda)), nsim=nsim)
  # compute isar and envelopes for each species
  # It is COMPULSORY that the argument "savefuns" it is set to TRUE
   isar.lansing[[i]] <- envelope(lansing, isar, mimark=levels(lansing$marks)[i],  r=r,
         simulate=simulados,nsim=nsim, savefuns=TRUE, buffer=0)
}


prop.isar.lansing <- proportion.idar(isar.lansing)
head(prop.isar.lansing $percentage)
head(prop.isar.lansing $behaviour)
plot(prop.isar.lansing, p.legend=c(0.15,60))

## Not run: 
##D 
##D # Compute percentage of accumulator, neutral an repeller species (for ISAR) in San Francisco
##D # forest.  In this example, against a null model of IPP.
##D data(SF)
##D 
##D # Discard the size mark and keep the species mark in SF ppp:
##D sfsp<- ppp(SF$x, SF$y, window=SF$window, marks=SF$marks$species)
##D 
##D # Compute ISAR and plot envelopes for an inhomogeneous Poisson model
##D # of each species in San Francisco plot
##D # Split sfsp point pattern ppp by species
##D sfsp.sp<- split(sfsp)
##D # Select species with >= 10 individuals (to get some statistical power)
##D sfsp10 <- sapply(sfsp.sp, function(x) x$n>=10)
##D #Get names of those species
##D nombressf<- names(sfsp10[sfsp10])
##D # Set parameters for the simulations, estimation of intensity surface for IPP, etc.
##D nsim<-199
##D nmin<-10
##D sigma <- 8
##D r<- seq(1,15, by=0.5)
##D # Create list to store the results
##D isar.sf<- list()
##D # start computation
##D # BEWARE: THIS TAKES QUITE A FEW MINUTES!!!
##D for( sp in nombressf){
##D    print(sp)
##D    # estimate intensity of the focal species
##D    lambda<- density(unmark(sfsp[sfsp$marks==sp]), sigma=sigma, positive=TRUE)
##D    # obtain simulated patterns were all species except the focal remain fixed
##D    # and the focal varies according to an inhomomgeneous Poiisson process
##D    simulados<- multifocalsimulator(sfsp, mimark=sp,
##D                             simulate=expression(rpoispp(lambda)), nsim=nsim,nmin=nmin)
##D   # compute isar and envelopes for each species
##D   # It is COMPULSORY that the argument "savefuns" it is set to TRUE
##D    isar.sf[[sp]] <- envelope(sfsp, isar, mimark=sp,  r=r,
##D          simulate=simulados,nsim=nsim, savefuns=TRUE, buffer=0)
##D }
##D 
##D 
##D prop.isar.SF <- proportion.idar(isar.sf)
##D head(prop.isar.SF$percentage)
##D head(prop.isar.SF$behaviour)
##D plot(prop.isar.SF)
##D 
## End(Not run)



