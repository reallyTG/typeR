library(ecospat)


### Name: ecospat.niche.zProjGeo
### Title: Projection of Occurrence Densities to the Geography
### Aliases: ecospat.niche.zProjGeo

### ** Examples

## Not run: 
##D 
##D library(raster)
##D 
##D spp <- ecospat.testNiche
##D xy.sp1<-subset(spp,species=="sp1")[2:3] #Bromus_erectus
##D 
##D load(system.file("extdata", "ecospat.testEnvRaster.Rdata", package="ecospat"))
##D #?ecospat.testEnvRaster
##D 
##D env.sp1<-extract(env,xy.sp1)
##D env.bkg<-na.exclude(values(env))
##D 
##D #################################### PCA-ENVIRONMENT ##################################
##D 
##D pca.cal <- dudi.pca(env.bkg, center = TRUE, scale = TRUE, scannf = FALSE, nf = 2)
##D 
##D # predict the scores on the axes
##D scores.bkg <- pca.cal$li  #scores for background climate
##D scores.sp1 <- suprow(pca.cal,env.sp1)$lisup				#scores for sp1
##D 
##D # calculation of occurence density (niche z)
##D   
##D z1 <- ecospat.grid.clim.dyn(scores.bkg, scores.bkg, scores.sp1,R=100)
##D 
##D plot(z1$z.uncor)
##D points(scores.sp1)
##D 
##D #################################### occurrence density in space ##################################
##D 
##D # sp1
##D geoz1<-ecospat.niche.zProjGeo(z1,env)
##D plot(geoz1,main="z1")
##D points(xy.sp1)
## End(Not run)


