library(SDraw)


### Name: halton.lattice.polygon
### Title: Halton lattice inside a 'SpatialPolygon*' object.
### Aliases: halton.lattice.polygon
### Keywords: design survey

### ** Examples


# Take and plot Halton lattice to illustrate
WA.hgrid <- halton.lattice.polygon( WA, J=c(3,2), eta=c(3,2), triangular=TRUE )
plot(WA)
points(WA.hgrid, pch=16, cex=.5, col="red" )

# Plot the Halton boxes
tmp.J <- attr(WA.hgrid,"J")
tmp.b <- attr(WA.hgrid,"bases")
tmp.bb <- attr(WA.hgrid,"hl.bbox")

for(d in 1:2){
  tmp2 <- tmp.bb[d,1] + (0:(tmp.b[d]^tmp.J[d]))*(diff(tmp.bb[d,]))/(tmp.b[d]^tmp.J[d])
  if( d == 1){
      abline(v=tmp2, col="blue")
  } else{
      abline(h=tmp2, col="blue")
  }
}

# To explore, re-run the above changing J, eta, and triangular, 



