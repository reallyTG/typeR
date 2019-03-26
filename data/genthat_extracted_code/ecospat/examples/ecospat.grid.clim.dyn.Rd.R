library(ecospat)


### Name: ecospat.grid.clim.dyn
### Title: Dynamic Occurrence Densities Grid
### Aliases: ecospat.grid.clim.dyn

### ** Examples

## Not run: 
##D 
##D data(ecospat.testNiche)
##D data(ecospat.testData)
##D 
##D spp <- ecospat.testNiche
##D clim <- ecospat.testData[2:8]
##D 
##D occ.sp_test <- na.exclude(ecospat.sample.envar(dfsp=spp,colspxy=2:3,colspkept=1:3,dfvar=clim,
##D colvarxy=1:2,colvar="all",resolution=25))
##D 
##D occ.sp<-cbind(occ.sp_test,spp[,4]) #add species names
##D 
##D # list of species
##D sp.list<-levels(occ.sp[,1])
##D sp.nbocc<-c()
##D 
##D for (i in 1:length(sp.list)){sp.nbocc<-c(sp.nbocc,length(which(occ.sp[,1] == sp.list[i])))} 
##D #calculate the nb of occurences per species
##D 
##D sp.list <- sp.list[sp.nbocc>4] # remove species with less than 5 occurences
##D nb.sp <- length(sp.list) #nb of species
##D ls()
##D # selection of variables to include in the analyses 
##D # try with all and then try only worldclim Variables
##D Xvar <- c(3:7)
##D nvar <- length(Xvar)
##D 
##D #number of interation for the tests of equivalency and similarity
##D iterations <- 100
##D #resolution of the gridding of the climate space
##D R <- 100
##D #################################### PCA-ENVIRONMENT ##################################
##D data<-rbind(occ.sp[,Xvar+1],clim[,Xvar]) 
##D w <- c(rep(0,nrow(occ.sp)),rep(1,nrow(clim)))
##D pca.cal <- dudi.pca(data, row.w = w, center = TRUE, scale = TRUE, scannf = FALSE, nf = 2)
##D 
##D ####### selection of species ######
##D sp.list
##D sp.combn <- combn(1:2,2)
##D 
##D for(i in 1:ncol(sp.combn)) {
##D   row.sp1 <- which(occ.sp[,1] == sp.list[sp.combn[1,i]]) # rows in data corresponding to sp1
##D   row.sp2 <- which(occ.sp[,1] == sp.list[sp.combn[2,i]]) # rows in data corresponding to sp2
##D   name.sp1 <- sp.list[sp.combn[1,i]]
##D   name.sp2 <- sp.list[sp.combn[2,i]]
##D   # predict the scores on the axes
##D   scores.clim <- pca.cal$li[(nrow(occ.sp)+1):nrow(data),]  #scores for global climate
##D   scores.sp1 <- pca.cal$li[row.sp1,]					#scores for sp1
##D   scores.sp2 <- pca.cal$li[row.sp2,]					#scores for sp2
##D }
##D # calculation of occurence density and test of niche equivalency and similarity 
##D z1 <- ecospat.grid.clim.dyn(scores.clim, scores.clim, scores.sp1,R=100)
##D z2 <- ecospat.grid.clim.dyn(scores.clim, scores.clim, scores.sp2,R=100)
## End(Not run)


