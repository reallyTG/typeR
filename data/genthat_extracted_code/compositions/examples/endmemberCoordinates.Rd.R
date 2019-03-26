library(compositions)


### Name: endmemberCoordinates
### Title: Recast amounts as mixtures of end-members
### Aliases: endmemberCoordinates endmemberCoordinatesInv
###   endmemberCoordinates.default endmemberCoordinates.acomp
###   endmemberCoordinates.aplus endmemberCoordinates.rplus
###   endmemberCoordinatesInv endmemberCoordinatesInv.rmult
###   endmemberCoordinatesInv.acomp endmemberCoordinatesInv.aplus
###   endmemberCoordinatesInv.rcomp endmemberCoordinatesInv.rplus
### Keywords: multivariate

### ** Examples

data(SimulatedAmounts)
ep <- aplus(rbind(c(2,1,2),c(2,2,1),c(1,2,2)))
# mix the endmembers in "ep" with weights given by "sa.lognormals"
dat <- endmemberCoordinatesInv(acomp(sa.lognormals),acomp(ep))
par(mfrow=c(1,2))
plot(dat)
  plot(acomp(ep),add=TRUE,col="red",pch=19)
# compute the barycentric coordinates of the mixture in the "end-member simplex"
plot( acomp(endmemberCoordinates(dat,acomp(ep))))

dat <- endmemberCoordinatesInv(rcomp(sa.lognormals),rcomp(ep))
plot(dat)
plot( rcomp(endmemberCoordinates(dat,rcomp(ep))))

dat <- endmemberCoordinatesInv(aplus(sa.lognormals),aplus(ep))
plot(dat)
plot( endmemberCoordinates(dat,aplus(ep)))

dat <- endmemberCoordinatesInv(rplus(sa.lognormals),rplus(ep))
plot(dat)
plot(endmemberCoordinates(rplus(dat),rplus(ep)))





