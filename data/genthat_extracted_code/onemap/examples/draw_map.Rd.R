library(onemap)


### Name: draw_map
### Title: Draw a genetic map
### Aliases: draw_map
### Keywords: rqtl

### ** Examples


## Not run: 
##D  #outcross example
##D   data(example_out)
##D   twopt <- rf_2pts(example_out)
##D   lg<-group(make_seq(twopt, "all"))
##D   maps<-vector("list", lg$n.groups)
##D   for(i in 1:lg$n.groups)
##D      maps[[i]]<- make_seq(order_seq(input.seq= make_seq(lg,i),twopt.alg =
##D    "rcd"), "force")
##D   draw_map(maps, grid=TRUE)
##D   draw_map(maps, grid=TRUE, horizontal=TRUE)
##D 
##D   #F2 example
##D   data(onemap_example_f2)
##D   twopt<-rf_2pts(onemap_example_f2)
##D   lg<-group(make_seq(twopt, "all"))
##D   maps<-vector("list", lg$n.groups)
##D   for(i in 1:lg$n.groups)
##D      maps[[i]]<- make_seq(order_seq(input.seq= make_seq(lg,i),twopt.alg =
##D    "rcd"), "force")
##D   draw_map(maps, grid=TRUE)
##D   draw_map(maps, grid=TRUE, horizontal=TRUE)
##D 
## End(Not run)




