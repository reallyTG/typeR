library(adegenet)


### Name: coords.monmonier
### Title: Returns original points in results paths of an object of class
###   'monmonier'
### Aliases: coords.monmonier
### Keywords: methods manip

### ** Examples


## Not run: 
##D if(require(spdep)){
##D 
##D load(system.file("files/mondata1.rda",package="adegenet"))
##D cn1 <- chooseCN(mondata1$xy,type=2,ask=FALSE)
##D mon1 <- monmonier(mondata1$xy,dist(mondata1$x1),cn1,threshold=2,nrun=3)
##D 
##D mon1$run1
##D mon1$run2
##D mon1$run3
##D path.coords <- coords.monmonier(mon1)
##D path.coords
##D }
## End(Not run)



