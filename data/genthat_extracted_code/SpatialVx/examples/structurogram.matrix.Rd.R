library(SpatialVx)


### Name: structurogram.matrix
### Title: Structure Function for Gridded Fields
### Aliases: structurogram.matrix plot.structurogram.matrix
### Keywords: math

### ** Examples

data( "lennon" )
look <- structurogram.matrix(lennon, q=2)
plot(look)
# Compare the above with
## Not run: 
##D look2 <- vgram.matrix(lennon)
##D dev.new()
##D par(mfrow=c(1,2),bg="beige")
##D plot(look2$d, look2$vgram, xlab="separation distance", ylab="variogram")
##D points(look2$d.full, look2$vgram.full, pch=".")
##D plot.vgram.matrix(look2)
##D 
##D look <- structurogram.matrix(lennon, q=1)
##D plot(look)
##D 
##D look <- structurogram.matrix(lennon, q=1, zero.out=TRUE)
##D plot(look)
## End(Not run)



