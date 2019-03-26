library(magclass)


### Name: magpply
### Title: magpply
### Aliases: magpply

### ** Examples


## Not run: 
##D  
##D data("population_magpie")
##D magpply(population_magpie,FUN=sum,MARGIN=2)
##D fourdim<-population_magpie*setNames(population_magpie,c("jkk","lk"))
##D magpply(fourdim,FUN=sum,MARGIN=c(1,3.1))
##D magpply(fourdim,FUN=function(x){return(x+1)},MARGIN=c(1,3.1),integrate=TRUE)
## End(Not run)




