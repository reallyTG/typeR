library(adespatial)


### Name: create.dbMEM.model
### Title: Combine dbMEM matrices corresponding to groups of sites
### Aliases: create.dbMEM.model
### Keywords: spatial

### ** Examples

{
 # Generate random coordinates for 35 sites forming 6 distinct groups on the map
 Easting <- runif(35)+c(rep(0,6),rep(1.5,7),rep(3,6), rep(0,5),rep(1.5,5),rep(3,6))
 Northing<- runif(35)+c(rep(2.8,6),rep(2.3,7),rep(2.8,6), rep(0,5),rep(0.5,5),rep(0,6))
 cartesian <- cbind(Easting,Northing)
 rownames(cartesian) <- paste("S",1:nrow(cartesian),sep='')
 nsites.per.group <- c(6,7,6,5,5,6)

 result <- create.dbMEM.model(coord=cartesian, nsites=nsites.per.group)

 # Draw a map to check the coding of the sites into the groups
 site.codes <- unlist(apply(cbind(1:6),1,n=nsites.per.group,function(a,n) rep(a,n[a])))

 col.vec <- c("green3","gray99","orange2","gold1","brown3","gray70")
 plot(cartesian, pch=22, col="black", bg=col.vec[site.codes], cex=2, ylim=c(0,4),asp=1)
 text(cartesian,labels=rownames(cartesian), cex=0.5, pos=3)

 # Examine the staggered matrix of dbMEM eigenfunctions
 # Not run:
 result
}





