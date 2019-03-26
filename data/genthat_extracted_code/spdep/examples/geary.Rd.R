library(spdep)


### Name: geary
### Title: Compute Geary's C
### Aliases: geary
### Keywords: spatial

### ** Examples

data(oldcol)
col.W <- nb2listw(COL.nb, style="W")
str(geary(COL.OLD$CRIME, col.W, length(COL.nb), length(COL.nb)-1,
 Szero(col.W)))



