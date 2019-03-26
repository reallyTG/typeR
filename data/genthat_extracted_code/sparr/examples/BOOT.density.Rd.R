library(sparr)


### Name: BOOT.density
### Title: Bootstrap bandwidth for a spatial kernel density estimate
### Aliases: BOOT.density

### ** Examples

## No test: 
data(pbc)

## Fixed bandwidth selection ##
BOOT.density(pbc) # ~20 secs
BOOT.density(pbc,eta=OS(pbc)/2) # halve default reference bandwidth
BOOT.density(pbc,eta=OS(pbc)*2) # double default reference bandwidth

# supplying pre-defined reference density as fixed-bandwidth 'bivden' object
pbcfix <- bivariate.density(pbc,h0=2.5,resolution=64)
system.time(hfix <- BOOT.density(pbc,ref.density=pbcfix,parallelise=4)) # parallelisation; 14 secs
hfix

## Global (for adaptive) bandwidth selection ##
# ~200 secs next line; use 'parallelise' for speedup
system.time(hada <- BOOT.density(pbc,type="adaptive")) # minimal usage for adaptive bootstrap
hada

# ~80 secs next line. Set custom h limits; increase reference bandwidth;
#    set custom pilot bandwidth; return objective function
system.time(hada <- BOOT.density(pbc,hlim=c(0.9,8),eta=3.5,type="adaptive",
                                 hp=OS(pbc)/2,parallelise=6,
                                 sim.adapt=list(objective=TRUE)))
hada[which.min(hada[,2]),1]
plot(hada);abline(v=hada[which.min(hada[,2]),1],col=2)
## End(No test)



