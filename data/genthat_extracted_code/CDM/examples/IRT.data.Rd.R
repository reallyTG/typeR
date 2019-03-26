library(CDM)


### Name: IRT.data
### Title: S3 Method for Extracting Used Item Response Dataset
### Aliases: IRT.data IRT.data.din IRT.data.gdina IRT.data.mcdina
###   IRT.data.gdm IRT.data.slca IRT.data.reglca

### ** Examples

## Not run: 
##D #############################################################################
##D # EXAMPLE 1: Several models for sim.dina data
##D #############################################################################
##D 
##D data(sim.dina, package="CDM")
##D data(sim.qmatrix, package="CDM")
##D 
##D dat <- sim.dina
##D q.matrix <- sim.qmatrix
##D 
##D #--- Model 1: GDINA model
##D mod1 <- CDM::gdina( data=dat, q.matrix=q.matrix)
##D summary(mod1)
##D dmod1 <- CDM::IRT.data(mod1)
##D str(dmod1)
##D 
##D #--- Model 2: DINA model
##D mod2 <- CDM::din( data=dat, q.matrix=q.matrix)
##D summary(mod2)
##D dmod2 <- CDM::IRT.data(mod2)
##D 
##D #--- Model 3: Rasch model with gdm function
##D mod3 <- CDM::gdm( data=dat, irtmodel="1PL", theta.k=seq(-4,4,length=11),
##D                 centered.latent=TRUE )
##D summary(mod3)
##D dmod3 <- CDM::IRT.data(mod3)
##D 
##D #--- Model 4: Latent class model with two classes
##D 
##D dat <- sim.dina
##D I <- ncol(dat)
##D 
##D # define design matrices
##D TP <- 2     # two classes
##D # The idea is that latent classes refer to two different "dimensions".
##D # Items load on latent class indicators 1 and 2, see below.
##D Xdes <- array(0, dim=c(I,2,2,2*I) )
##D items <- colnames(dat)
##D dimnames(Xdes)[[4]] <- c(paste0( colnames(dat), "Class", 1),
##D           paste0( colnames(dat), "Class", 2) )
##D     # items, categories, classes, parameters
##D # probabilities for correct solution
##D for (ii in 1:I){
##D     Xdes[ ii, 2, 1, ii ] <- 1    # probabilities class 1
##D     Xdes[ ii, 2, 2, ii+I ] <- 1  # probabilities class 2
##D }
##D # estimate model
##D mod4 <- CDM::slca( dat, Xdes=Xdes)
##D summary(mod4)
##D dmod4 <- CDM::IRT.data(mod4)
## End(Not run)



