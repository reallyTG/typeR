library(lba)


### Name: plotcorr
### Title: Plot lba objects using the correspondence analysis approach as
###   suggested by Jelihovschi (2011).
### Aliases: plotcorr plotcorr.lba.1d plotcorr.lba.2d plotcorr.lba.3d
### Keywords: lba correpondence analysis plot

### ** Examples

data('votB')
K = 2
ex1 <- lba(parties ~ city,
           data=votB,
           K = 2) 
plotcorr(ex1)

#It's very simple. with colors!
plotcorr(ex1,
         col.points = 3:5,
         col.budget = c(5,3))

#Changing radius!
plotcorr(ex1,
         radius = rep(0.7,2))

#Without metrics!
plotcorr(ex1,
         metrics = FALSE)

#Change legend options!
plotcorr(ex1,
         args.legend = list(ncol=3)) 

#Change height points!
plotcorr(ex1,
         height.points = rep(-0.1,6))


## Not run: 
##D #K = 3
##D K = 3
##D ex2 <- lba(parties ~ city,
##D            data=votB,
##D            K = 3)
##D 
##D plotcorr(ex2)
##D 
##D #Change budget options
##D plotcorr(ex2,
##D          pch.budget = 5,
##D          col.budget = 2,
##D          labels.budget = c('lba1','lba2','lba3'))
##D 
##D #Change points options
##D plotcorr(ex2,
##D          pch.points = 20,
##D          col.points = 4,
##D          labels.points = rownames(ex2$Aoi),
##D          args.legend = list(plot=FALSE))
##D 
##D #Coloring the groups
##D plotcorr(ex2,
##D          col.points = c(1,2,2,3,3,2),
##D          col.budget = c(3,1,2),
##D          args.legend = list(ncol=3))
##D 
##D #K = 4
##D K = 4
##D data(postmater)
##D new_post <- as.matrix(postmater[,-1])
##D row.names(new_post) <- postmater[,1]
##D 
##D ex3 <- lba(new_post,
##D            K = K)
##D 
##D plotcorr(ex3)
##D 
##D 
##D 
##D #A bit didatic!
##D plotcorr(ex3,
##D          args.legend = list(x = -2.5,
##D                             y = 5.5,
##D                             xpd=TRUE,
##D                             ncol=5))
##D 
##D #Dynamic? Yes, you can!
##D plotcorr(ex3,
##D      rgl.use = TRUE)
## End(Not run)



