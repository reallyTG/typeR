library(sirt)


### Name: mcmclist2coda
### Title: Write Coda File from an Object of Class 'mcmc.list'
### Aliases: mcmclist2coda
### Keywords: coda

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: MCMC estimation 2PNO dataset Reading
##D #############################################################################
##D 
##D data(data.read)
##D # estimate 2PNO with MCMC with 3000 iterations and 500 burn-in iterations
##D mod <- sirt::mcmc.2pno( dat=data.read, iter=3000, burnin=500 )
##D # plot MCMC chains
##D plot( mod$mcmcobj, ask=TRUE )
##D # write sampled chains into codafile
##D mcmclist2coda( mod$mcmcobj, name="dataread_2pl" )
## End(Not run)



