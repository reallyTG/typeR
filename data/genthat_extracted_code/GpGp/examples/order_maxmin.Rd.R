library(GpGp)


### Name: order_maxmin
### Title: Maximum minimum distance ordering
### Aliases: order_maxmin

### ** Examples

# planar coordinates
nvec <- c(50,50)
locs <- as.matrix( expand.grid( 1:nvec[1]/nvec[1], 1:nvec[2]/nvec[2] ) )
ord <- order_maxmin(locs)
par(mfrow=c(1,3))
plot( locs[ord[1:100],1], locs[ord[1:100],2], xlim = c(0,1), ylim = c(0,1) )
plot( locs[ord[1:300],1], locs[ord[1:300],2], xlim = c(0,1), ylim = c(0,1) )
plot( locs[ord[1:900],1], locs[ord[1:900],2], xlim = c(0,1), ylim = c(0,1) )

# longitude/latitude coordinates (sphere)
latvals <- seq(-80, 80, length.out = 40 )
lonvals <- seq( 0, 360, length.out = 81 )[1:80]
locs <- as.matrix( expand.grid( lonvals, latvals ) )
ord <- order_maxmin(locs, lonlat = TRUE)
par(mfrow=c(1,3))
plot( locs[ord[1:100],1], locs[ord[1:100],2], xlim = c(0,360), ylim = c(-90,90) )
plot( locs[ord[1:300],1], locs[ord[1:300],2], xlim = c(0,360), ylim = c(-90,90) )
plot( locs[ord[1:900],1], locs[ord[1:900],2], xlim = c(0,360), ylim = c(-90,90) )




