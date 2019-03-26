library(idar)


### Name: envelope4idar
### Title: Compute Simulation Envelopes for IDAR(r) Functions
### Aliases: envelope4idar idar2 raoDmod
### Keywords: spatial

### ** Examples




# compute envelope for isar around sp_44
data(SF)
data(SFtraits)
data(SFphylotree)

  
# 1) Create a list with simulations of the focal species point pattern  with simulador2()
#     or by hand. # Beware that each simulated ppp should be marked (with the mark
#      of the focal species)

#  Example for simulations of an inomogenous PP
# Adjust an IPP:
    
    sp_44.ipp<- density.ppp(unmark(SF[SF$marks$species=="sp_44"]))
   
# simulate 19 realizations of the adjusted IPP
# (BEWARE: in real tests you should use 199 or higher)
    sp_44.ipp.sim <- vector(mode="list", le=19)
    sp_44.ipp.sim <- lapply(sp_44.ipp.sim, function(x) x=rpoispp(sp_44.ipp))
   # mark each simulated pattern
    sp_44.ipp.sim.m <- lapply(sp_44.ipp.sim, function(x) 
                                       {marks(x) = factor(rep("sp_44", x$n)); return(x)})

# 2) compute.envelopes
     # ISAR
  isar.sp_44.ipp.env<- envelope4idar(mippp=SF, mippp.sp.sim= sp_44.ipp.sim.m,
                mimark="sp_44", namesmark="species",r=1:30, buffer=0) 
## Not run: 
##D      # IFDAR
##D  ifdar.sp_44.ipp.env<- envelope4idar(mippp=SF, mippp.sp.sim= sp_44.ipp.sim.m,
##D                 mimark="sp_44",  namesmark="species", r=1:30, idar="ifdar", buffer=0, 
##D 		nsim=99, traits=SFtraits, correct.trait.na=TRUE)
##D 
##D     #IPSVAR
##D    ipsvar.sp_44.ipp.env<- envelope4idar(mippp=SF, mippp.sp.sim= sp_44.ipp.sim.m,
##D                  mimark="sp_44", namesmark="species", r=1:30, idar="ipsvar", buffer=0, 
##D 		 nsim=99, tree=SFphylotree)
##D 
##D ####################################
##D # Computing CROSS_IDAR
##D #--------------------------------------------------
##D 
##D # You need a focal pattern that its not part of the multivariate pattern which is "measured"
##D # to estimate diversity.
##D # For example, let's measure diversity of small trees  around large trees of the focal species.
##D 
##D # First, obtain the pattern of large and small trees
##D # the pattern of small trees will be the "measured" one, i.e., the argument "mippp"
##D 
##D SFlarge<- SF[SF$marks$dbh>=10]
##D SFsmall <- SF[SF$marks$dbh<10]
##D 
##D # pattern of the focal species (this will be the argument "mippp.sp")
##D sp_44.large<- SFlarge[SFlarge$marks$species=="sp_44"]
##D 
##D # list of simulated patterns of the focal species (e.g., from an IPP)
##D sp_44.large.ipp<- density.ppp(sp_44.large)
##D sp_44.large.ipp.sim <- vector(mode="list", le=99)
##D sp_44.large.ipp.sim <- lapply(sp_44.large.ipp.sim, function(x) x=rpoispp(sp_44.large.ipp))
##D 
##D # COMPUTE envelopes for cross-ISAR(r)
##D  isar.sp_44.large.cross.ipp.env<- envelope4idar(mippp=SFsmall, r=1:30, buffer=0,
##D 			mippp.sp.sim= sp_44.large.ipp.sim, mippp.sp=sp_44.large,
##D                         namesmark="species", cross.idar =TRUE) 
##D 
##D # COMPUTE envelopes for cross-IFDAR(r)
##D ifdar.sp_44.large.cross.ipp.env<- envelope4idar(mippp=SFsmall, r=1:30, idar="ifdar", 
##D                        buffer=0, mippp.sp.sim= sp_44.large.ipp.sim,  mippp.sp=sp_44.large,
##D                        namesmark="species", traits=SFtraits, correct.trait.na=TRUE,
##D                        cross.idar =TRUE) 
##D 
##D # COMPUTE envelopes for cross-IPSVAR(r)
##D ipsvar.sp_44.large.cross.ipp.env<- envelope4idar(mippp=SFsmall, r=1:30, idar="ipsvar", 
##D                       buffer=0, mippp.sp.sim= sp_44.large.ipp.sim,  mippp.sp=sp_44.large,
##D                       namesmark="species",  tree=SFphylotree, cross.idar =TRUE) 
##D 
##D 
##D ####################################
##D # Comparing the performance of envelope() and envelope4idar()
##D # 
##D #--------------------------------------------------
##D require(ecespa) # for the ipc.estK() function
##D data(SF)
##D SFsp<- unmark(SF)
##D marks(SFsp)<- SF$marks$species
##D sp_44.ppp<-unmark(SF[SF$marks$species=="sp_44"])
##D sp_44.pc<- ipc.estK(sp_44.ppp)
##D 
##D 
##D # use multifocalsimulator() to use the same simulations with both functions.
##D sp_44.pc.sim.mf0<-multifocalsimulator(pp=SFsp, mimark="sp_44",
##D                            simulate=expression(rIPCP(sp_44.pc)), nsim=99, nmin=sp_44.ppp$n)
##D 
##D # envelopes with function envelope()
##D gc()
##D t0<- Sys.time()
##D   ifdar.sp_44.pc.env.e2<- envelope(SFsp, fun=ifdar, mimark="sp_44", traits=SFtraits,
##D                             correct.trait.na=TRUE, nsim=99, simulate=sp_44.pc.sim.mf0, r=1:30,
##D                             savefuns=TRUE, buffer=0)
##D Sys.time()-t0
##D 
##D # envelopes with function envelope4idar()
##D 
##D # Here you should input simulated patterns only for the focal species so, first,
##D # extract it fom the list of simulated multivariate ppp
##D 
##D sp_44.pc.sim.mf00<- lapply(sp_44.pc.sim.mf0, function(x) {x=x[x$marks=="sp_44"];return(x)})
##D 
##D gc()
##D t0<- Sys.time()
##D ifdar.sp_44.pc.env2<- envelope4idar(mippp=SF, mippp.sp.sim= sp_44.pc.sim.mf00, mimark="sp_44",
##D 				namesmark="species", r=1:30, idar="ifdar", buffer=0, 
##D                                 nsim=99, traits=SFtraits, correct.trait.na=TRUE)
##D Sys.time()-t0
##D 
##D 
## End(Not run)



