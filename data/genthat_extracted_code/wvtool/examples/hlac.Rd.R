library(wvtool)


### Name: hlac
### Title: Higher Order Local Autocorrelation (HLAC)
### Aliases: hlac

### ** Examples

# features plot and the corresponding image presentation
data(camphora)
tmp <- hlac(gray2bin(camphora), 2, disp=TRUE)
par(mfrow=c(2,2))
plot(unlist(tmp$features), main="HLAC histogram")
image(rot90c(matrix(tmp$mat[2,],tmp$row,tmp$col)),
	col  = gray((255:0)/255), main="2", useRaster=TRUE, asp=1, axes=FALSE)
image(rot90c(matrix(tmp$mat[23,],tmp$row,tmp$col)),
	col  = gray((255:0)/255), main="23", useRaster=TRUE, asp=1, axes=FALSE)
image(rot90c(matrix(tmp$mat[156,],tmp$row,tmp$col)),
	col  = gray((255:0)/255), main="156", useRaster=TRUE, asp=1, axes=FALSE)



