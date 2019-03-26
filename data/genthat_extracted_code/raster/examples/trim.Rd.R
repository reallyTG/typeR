library(raster)


### Name: trim
### Title: Trim
### Aliases: trim trim,Raster-method trim,character-method
###   trim,matrix-method trim,data.frame-method
### Keywords: spatial

### ** Examples

r <- raster(ncol=18,nrow=18)
r[39:49] <- 1
r[113:155] <- 2
r[200] <- 6
s <- trim(r) 


trim("    hi folks    !   ")



