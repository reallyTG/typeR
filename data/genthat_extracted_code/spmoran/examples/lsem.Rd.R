library(spmoran)


### Name: lsem
### Title: Low rank spatial error model (LSEM) estimation
### Aliases: lsem

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV" ]
x	<- boston.c[,c("CRIM","ZN","INDUS", "CHAS", "NOX","RM", "AGE",
                       "DIS" ,"RAD", "TAX", "PTRATIO", "B", "LSTAT")]
coords  <- boston.c[,c("LAT","LON")]
weig 	<- weigen( coords )
res	<- lsem(y=y,x=x,weig=weig)
res$b
res$s
res$e



