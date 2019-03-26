library(idar)


### Name: ipsim
### Title: Simulate Multivariate Point Patterns
### Aliases: ipsim ipsimlist simulador2 multifocalsimulator
### Keywords: spatial

### ** Examples



# Build a multivariate point pattern where maple is simulated according to a Poisson process
# and where all the other species are keep fixed in their original coordinates.
# (The warnings are because in the original lansing point pattern there is a dupplicated
#  point)

data(lansing) 
ipsim(pp=lansing, mimark="maple")

# Build a multivariate point pattern where maple is simulated according to an Inhomogeneous
# Poisson process from an intensity surface estimated "on the fly" with a Gaussian kernel with
# sd = "sigma", and where all the other species are keep fixed in their original coordinates.

ipsim(pp=lansing, mimark="maple", sigma=0.1)

# Build a multivariate point pattern where maple is simulated according to an Inhomogeneous
# Poisson process from a predefined  intensity surface "lambda" and where all the other
# species are keep fixed in their original coordinates. "Lambda" is an im object resulting
# from density.ppp(), from predict.ppm() or converted from any other rasterized image. 

maple.lambda<- density.ppp(lansing[lansing$marks=="maple"])
ipsim(pp=lansing, mimark="maple", lambda=maple.lambda)

# Build a list of 19 multivariate point pattern where maple is simulated according to an
# Inhomogeneous Poisson process from a predefined  intensity surface "lambda" and where all
# the other species are keep fixed in their original coordinates. "Lambda" is an im object
# resulting  from density.ppp(), # from predict.ppm() or converted from any other rasterized
# image. 

  # Estimate the intensity of maple
   maple.lambda<- density(unmark(lansing[lansing$marks=="maple"]))

  # first simulate the individual maple patterns
   maple.sim<- simulador2(mimark="maple", milambda=maple.lambda, nsim=19)

  # Then, mix the simulated maple patterns with the rest of the multivariate pattern
  # (which remains "fixed")
   multi.maple.sim<- ipsimlist(pp=lansing, mimark="maple", listsim=maple.sim)


## Use of multifocalsimulator() ##

# The same but in a single step with multifocalsimulator(): Build a list of 19 multivariate
# point pattern where maple is simulated according to an Inhomogeneous Poisson process
# from a predefined  intensity surface "lambda" and where all the other species are keep 
# fixed in their original coordinates. "Lambda" is an im object resulting from density.ppp(),
# from predict.ppm() or converted from any other rasterized image. 

   # Estimate the intensity of maple
   maple.lambda<- density(unmark(lansing[lansing$marks=="maple"]))

   # get 99 simulated multivariate point patterns where only maple varies,
   # according to an inhomogeneous Poisson process
   multi.maple.sim <- multifocalsimulator(lansing, "maple", nsim=99,
                                         simulate=expression(rpoispp(maple.lambda)))

## Not run: 
##D    # Use the simulated multivariate patterns to compute  envelopes for the ISAR against
##D    # a null model of IPP for maple 
##D    isar.maple.env<- envelope(lansing, fun=isar, mimark="maple", nsim=99, savefuns=TRUE,
##D                                          r=seq(0.01, 0.25, le=100), simulate=multi.maple.sim)
##D    plot( isar.maple.env)
##D 
##D 
##D 
##D # Use multifocalsimulator()  to compute  envelopes for the ISAR against a null model of
##D # Poisson cluster for maple.
##D 
##D    # First, adjust a Poisson Cluster process to maple
##D    require(ecespa)
##D    maple.pc<- ipc.estK(unmark(lansing[lansing$marks=="maple"]))
##D 
##D   # generate list of simulated multivariate partterns (all other species fixed and maple
##D   # simulated according to the adjusted PC process):
##D    maple.pc.sim<-multifocalsimulator(pp=lansing, mimark="maple", nsim=99,nmin=NULL,
##D                                                  simulate=expression(rIPCP(maple.pc)))
##D 
##D   # compute envelopes
##D    isar.maple.pc.env<- envelope(lansing, fun=isar, mimark="maple", nsim=99, savefuns=TRUE, 
##D                                             simulate=maple.pc.sim, r=seq(0.01, 0.25, le=100))
##D    plot( isar.maple.pc.env)
##D 
##D 
##D # Compute  envelopes for the IFDAR against a null model of Poisson cluster for sp_44 in
##D # San Francisco forest.
##D    data(SF)
##D    data(SFtraits)
##D 
##D    # first, get the original point pattern but with marks only for the species (i.e., dsicard 
##D    # the data.frame of marks and keep only the vector of species names)
##D    SFsp<- unmark(SF)
##D    marks(SFsp)<- SF$marks$species
##D 
##D    # second, adjust a PCP to sp_44
##D    sp_44.pc<- ipc.estK(unmark(SFsp[SFsp$marks=="sp_44"]))
##D 
##D   # third, generate multivariate simulated patterns with only sp_44 varying according
##D   # to the adjusted PCP
##D    sp_44.pc.sim<-multifocalsimulator(pp=SFsp, mimark="sp_44",nsim=99,nmin=NULL,
##D                                                  simulate=expression(rIPCP(sp_44.pc)))
##D 
##D    # finally, compute envelopes
##D    ifdar.sp_44.pc.env<- envelope(SFsp, fun=ifdar, mimark="sp_44", traits=SFtraits, r=1:30,
##D                         correct.trait.na=TRUE, nsim=99, simulate=sp_44.pc.sim,  savefuns=TRUE)
##D 
##D    plot( ifdar.sp_44.pc.env)
##D 
## End(Not run)



