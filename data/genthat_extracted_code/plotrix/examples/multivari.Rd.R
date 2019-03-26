library(plotrix)


### Name: multivari
### Title: Function to draw a multivari chart
### Aliases: multivari
### Keywords: hplot design

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
## Not run: 
##D require(car)
##D multivari("cycles", "len", "load", "amp", data=Wool, 
##D     col=list("black","red",c("grey70","grey45","grey20")),
##D     pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
##D multivari("cycles", "load", "len", "amp", data=Wool, 
##D     col=list("black",c("red","blue","darkgreen"),
##D     c("grey70","grey45","grey20")),
##D     pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2)
##D     
##D ## create a fake fourth factor
##D fakedat <- rbind(cbind(newfac="blabla",Wool),cbind(newfac="albalb",Wool))
##D ## make it character for demonstrating the effect of sort option
##D fakedat$newfac <- as.character(fakedat$newfac)
##D 
##D ## default: sort order in the data is respected (order of unique is used)
##D multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
##D     col=list("black",c("red","blue","darkgreen"),
##D     c("grey70","grey45","grey20")),
##D     pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8)
##D     
##D ## sort=TRUE: levels are sorted (order of sort(unique))
##D multivari("cycles", "load", "len", "amp", "newfac", data=fakedat, 
##D     col=list("black",c("red","blue","darkgreen"),
##D     c("grey70","grey45","grey20")),
##D     pch=list(15,17,8), legend=TRUE, xlab.depth = 2, lwd=2, cex=0.8,
##D     sort=TRUE)
## End(Not run)



