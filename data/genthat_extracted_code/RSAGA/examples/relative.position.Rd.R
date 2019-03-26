library(RSAGA)


### Name: relative.position
### Title: Relative Topographic Position
### Aliases: relative.position relative.rank
### Keywords: spatial

### ** Examples

m = matrix( round(runif(9,1,10)), ncol=3 )
print(m)
relative.position(m)
relative.rank(m)
## Not run: 
##D focal.function("dem",fun=relative.rank,radius=5)
##D focal.function("dem",fun=relative.position,radius=5)
##D relrank = as.vector(read.ascii.grid("relrank")$data)
##D relpos  = as.vector(read.ascii.grid("relpos")$data)
##D plot(relpos,relrank,pch=".")
##D cor(relpos,relrank,use="complete.obs",method="pearson")
## End(Not run)



