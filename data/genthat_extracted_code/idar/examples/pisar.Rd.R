library(idar)


### Name: pisar
### Title: Phylogenetic Individual Species Area Relationship
### Aliases: pisar risar controldis
### Keywords: spatial

### ** Examples


data(SF)
data(SFphylotree)

# Discard the size mark and keep the species mark in SF ppp:
sfsp<- ppp(SF$x, SF$y, window=SF$window, marks=SF$marks$species)

# compute phylogenetic distance among species
dphy <- cophenetic(SFphylotree)

# compute and plot PISAR function for sp_44
pisar_44 <- pisar(sfsp, mimark="sp_44", r=1:15,  d=dphy)
plot(pisar_44)

## Not run: 
##D 
##D # Compute rISAR and plot envelopes for an inhomogeneous Poisson model
##D #  of each species in San Francisco plot 
##D # BEWARE: THIS TAKES QUITE A FEW MINUTES !!!
##D 
##D # Split sfsp point pattern ppp by species
##D sfsp.sp<- split(sfsp)
##D 
##D #  Species with >= 10 individuals
##D sfsp10 <- sapply(sfsp.sp, function(x) x$n>=10)
##D #names of those species
##D nombressf<- names(sfsp10[sfsp10])
##D 
##D # parameters for the simulations, estimation of intensity, etc.
##D nsim<-199
##D nmin<-10
##D sigma <- 8
##D r<- seq(1,15, by=0.5)
##D 
##D # list to store results
##D risar.sf<- list()
##D # start computation
##D for( sp in nombressf){
##D    print(sp)
##D    # estimate intensity of the focal species
##D    lambda<- density(unmark(sfsp[sfsp$marks==sp]), sigma=sigma, positive=TRUE)      
##D    # obtain simulated patterns were all species ecept the focal remain fixed 
##D    #  and the focal varies according to an inhomomgeneous Poiisson process 
##D    simulados<- multifocalsimulator(sfsp, mimark=sp,
##D               simulate=expression(rpoispp(lambda)), nsim=nsim,nmin=nmin)
##D    # compute risar
##D    risar.sf[[sp]] <- envelope(sfsp, risar, mimark=sp, d=dphy, r=r,
##D         simulate=simulados,nsim=nsim, savefuns=T, buffer=0)
##D }
##D 
##D # plot the results
##D  dev.new(height=7, width=16)
##D  par(mfrow=c(3,9))
##D  for(i in 1:27) plot(risar.sf[[i]], legend=F, main=nombressf[i])
##D 
## End(Not run)





