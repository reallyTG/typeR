library(adaptTest)


### Name: pathCEF
### Title: Function to plot several conditional error functions running
###   through a "path" of given points
### Aliases: pathCEF

### ** Examples

## Compare the tests by Bauer and Koehne (1994), Lehmacher and Wassmer (1999) and Vandemeulebroecke (2006)
oldmfcol <- par(mfcol=c(1,3))
pathCEF(typ="b", main="BK 94")
pathCEF(typ="l", main="LW 99")
pathCEF(typ="v", main="V 06")
par(oldmfcol)



