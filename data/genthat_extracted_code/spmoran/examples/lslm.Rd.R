library(spmoran)


### Name: lslm
### Title: Low rank spatial lag model (LSLM) estimation
### Aliases: lslm

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV" ]
x	<- boston.c[,c("CRIM","ZN","INDUS", "CHAS", "NOX","RM", "AGE",
                       "DIS" ,"RAD", "TAX", "PTRATIO", "B", "LSTAT")]
coords  <- boston.c[,c("LAT","LON")]
weig 	  <- weigen(coords)
res	    <- lslm(y=y,x=x,weig=weig)
## res  <- lslm(y=y,x=x,weig=weig, boot=TRUE)
res$b
res$s
res$de
res$ie
res$e




