library(onemap)


### Name: write_map
### Title: Write a genetic map to a file
### Aliases: write_map
### Keywords: rqtl

### ** Examples


## Not run: 
##D data(mapmaker_example_f2)
##D twopt<-rf_2pts(mapmaker_example_f2)
##D lg<-group(make_seq(twopt, "all"))
##D 
##D ##"pre-allocate" an empty list of length lg$n.groups (3, in this case)
##D   maps.list<-vector("list", lg$n.groups)
##D 
##D   for(i in 1:lg$n.groups){
##D     ##create linkage group i
##D     LG.cur <- make_seq(lg,i)
##D     ##ordering
##D     map.cur<-order_seq(LG.cur, subset.search = "sample")
##D     ##assign the map of the i-th group to the maps.list
##D     maps.list[[i]]<-make_seq(map.cur, "force")
##D   }
##D 
##D ##write maps.list to "mapmaker_example_f2.map" file
##D write_map(map.list, "mapmaker_example_f2.map")
##D 
##D ##Using R/qtl
##D ##you must install the package  'qtl'
##D ##install.packages("qtl")
##D 
##D require(qtl)
##D file<-paste(system.file("example",package="onemap"),"mapmaker_example_f2.raw", sep="/")
##D dat1 <- read.cross("mm", file=file, mapfile="mapmaker_example_f2.map")
##D newmap <- est.map(dat1, tol=1e-6, map.function="kosambi")
##D 
##D (logliks <- sapply(newmap, attr, "loglik"))
##D plot.map(dat1, newmap)
##D 
##D ##Using R/qtl to generate QTL Cartographer input files (.map and .cro)
##D write.cross(dat1, format="qtlcart", filestem="mapmaker_example_f2")
##D 
## End(Not run)




