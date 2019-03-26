library(spmoran)


### Name: esf
### Title: Spatial regression with eigenvector spatial filtering
### Aliases: esf

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV" ]
x	<- boston.c[,c("CRIM","ZN","INDUS", "CHAS", "NOX","RM", "AGE")]
coords  <- boston.c[,c("LAT","LON")]

#########Distance-based ESF
meig 	<- meigen(coords=coords)
esfD	<- esf(y=y,x=x,meig=meig, vif=5)
esfD$vif
esfD$b
esfD$e

#########Fast approximation
meig_f<- meigen_f(coords=coords)
esfD	<- esf(y=y,x=x,meig=meig_f, vif=10, fn="all")

############################Not run
#########Topoligy-based ESF (it is commonly used in regional science)
#
#cknn	<- knearneigh(coordinates(coords), k=4) #4-nearest neighbors
#cmat	<- nb2mat(knn2nb(cknn), style="B")
#meig <- meigen(cmat=cmat, threshold=0.25)
#esfT	<- esf(y=y,x=x,meig=meig)




