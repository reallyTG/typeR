library(spmoran)


### Name: resf
### Title: Spatial regression with random effects eigenvector spatial
###   filtering
### Aliases: resf

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV" ]
x	<- boston.c[,c("CRIM","ZN","INDUS", "CHAS", "NOX","RM", "AGE",
                       "DIS" ,"RAD", "TAX", "PTRATIO", "B", "LSTAT")]
coords  <- boston.c[,c("LAT","LON")]
meig 	<- meigen(coords=coords)
res	<- resf(y=y,x=x,meig=meig)
res$b
res$s
res$e

#########Fast approximation
meig_f	<- meigen_f(coords=coords)
res  <- resf(y=y,x=x,meig=meig_f)



