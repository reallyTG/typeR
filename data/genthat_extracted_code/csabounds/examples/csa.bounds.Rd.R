library(csabounds)


### Name: csa.bounds
### Title: csa.bounds
### Aliases: csa.bounds

### ** Examples

## Not run: 
##D data(displacements)
##D delt.seq <- seq(-4,4,length.out=50)
##D y.seq <- seq(6.5,13,length.out=50)
##D cc <- qte::CiC(learn ~ treat,
##D                t=2011, tmin1=2007, tname="year",
##D                idname="id", panel=TRUE, data=displacements,
##D                probs=seq(.05,.95,.01),se=FALSE)
##D cc$F.treated.tmin2 <- ecdf(subset(displacements, year==2003 & treat==1)$learn)
##D cc$F.treated.tmin1 <- ecdf(subset(displacements, year==2007 & treat==1)$learn)
##D cb <- csa.bounds(learn ~ treat, 2011, 2007, 2003, "year", "id",
##D         displacements, delt.seq, y.seq, cc,
##D         method="level", cl=1)
##D cb
##D ggCSABounds(cb)
## End(Not run)



