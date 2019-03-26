library(ecospat)


### Name: ecospat.niche.dynIndexProjGeo
### Title: Projection of niche dynamic indices to the Geography
### Aliases: ecospat.niche.dynIndexProjGeo

### ** Examples

## Not run: 
##D 
##D library(raster)
##D 
##D spp <- ecospat.testNiche
##D xy.sp1<-subset(spp,species=="sp1")[2:3] #Bromus_erectus
##D xy.sp2<-subset(spp,species=="sp3")[2:3] #Daucus_carota
##D 
##D ?ecospat.testEnvRaster
##D load(system.file("extdata", "ecospat.testEnvRaster.Rdata", package="ecospat"))
##D 
##D env.sp1<-extract(env,xy.sp1)
##D env.sp2<-extract(env,xy.sp2)
##D env.bkg<-na.exclude(values(env))
##D 
##D #################################### PCA-ENVIRONMENT ##################################
##D 
##D pca.cal <- dudi.pca(env.bkg, center = TRUE, scale = TRUE, scannf = FALSE, nf = 2)
##D 
##D # predict the scores on the axes
##D scores.bkg <- pca.cal$li  #scores for background climate
##D scores.sp1 <- suprow(pca.cal,env.sp1)$lisup				#scores for sp1
##D scores.sp2 <- suprow(pca.cal,env.sp2)$lisup				#scores for sp2
##D 
##D # calculation of occurence density (niche z)
##D   
##D z1 <- ecospat.grid.clim.dyn(scores.bkg, scores.bkg, scores.sp1,R=100)
##D z2 <- ecospat.grid.clim.dyn(scores.bkg, scores.bkg, scores.sp2,R=100)
##D 
##D plot(z1$z.uncor)
##D points(scores.sp1)
##D 
##D plot(z2$z.uncor)
##D points(scores.sp2)
##D 
##D ecospat.niche.overlap(z1,z2 ,cor=T)
##D 
##D #################################### stability S in space ##################################
##D 
##D geozS<-ecospat.niche.dynIndexProjGeo(z1,z2,env,index="stability")
##D 
##D plot(geozS,main="Stability")
##D points(xy.sp1,col="red")
##D points(xy.sp2,col="blue")
## End(Not run)


