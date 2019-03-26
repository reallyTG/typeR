library(BatchMap)


### Name: draw.map
### Title: Draw a genetic map
### Aliases: draw.map
### Keywords: rqtl

### ** Examples


## Not run: 
##D  #outcross example
##D   data(example.out)
##D   twopt <- rf.2pts(example.out)
##D   lg<-group(make.seq(twopt, "all"))
##D   maps<-vector("list", lg$n.groups)
##D   for(i in 1:lg$n.groups)
##D      maps[[i]]<- make.seq(order.seq(input.seq= make.seq(lg,i),twopt.alg =
##D    "rcd"), "force")
##D   draw.map(maps, grid=TRUE)
##D   draw.map(maps, grid=TRUE, horizontal=TRUE)
##D 
## End(Not run)




