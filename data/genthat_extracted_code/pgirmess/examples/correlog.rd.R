library(pgirmess)


### Name: correlog
### Title: Computes Moran's or Geary's coefficients on distance classes
### Aliases: correlog plot.correlog print.correlog
### Keywords: spatial

### ** Examples


library(spdep)
data(oldcol)
attach(COL.OLD)
coords<-cbind(X,Y)
res<-correlog(coords,CRIME)
plot(res)

res<-correlog(coords,CRIME,method="Geary")
plot(res)




