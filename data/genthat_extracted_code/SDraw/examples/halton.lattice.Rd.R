library(SDraw)


### Name: halton.lattice
### Title: Halton lattice inside a rectangle
### Aliases: halton.lattice

### ** Examples


# Lattice of 2^3*3^2 = 72 points in unit box
hl <- halton.lattice( J=c(3,2) )

# Plot
hl.J <- attr(hl,"J")
hl.b <- attr(hl,"bases")
hl.bb <- attr(hl,"hl.bbox") 

plot( hl.bb[1,], hl.bb[2,], type="n", pty="s")
points( hl[,1], hl[,2], pch=16, cex=.75, col="red")

for(d in 1:ncol(hl)){
  tmp2 <- hl.bb[d,1] + (0:(hl.b[d]^hl.J[d]))*(diff(hl.bb[d,]))/(hl.b[d]^hl.J[d])
  if( d == 1){
      abline(v=tmp2)
  } else{
      abline(h=tmp2)
  }
}

# Lattice of approx 1000 points over bounding box of spatial object
hl <- halton.lattice( bbox(HI.coast), N=1000 )



