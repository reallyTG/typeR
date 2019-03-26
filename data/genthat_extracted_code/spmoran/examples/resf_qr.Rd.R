library(spmoran)


### Name: resf_qr
### Title: Spatial filter unconditional quantile regression
### Aliases: resf_qr

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV" ]
x	<- boston.c[,c("CRIM","ZN","INDUS", "CHAS", "NOX","RM", "AGE",
                       "DIS" ,"RAD", "TAX", "PTRATIO", "B", "LSTAT")]
coords  <- boston.c[,c("LAT","LON")]
meig 	<- meigen(coords=coords)
res	<- resf_qr(y=y,x=x,meig=meig, boot=FALSE)
res$b
res$s
res$e
plot_qr(res,1) #The first explanatory vafriable (intercept)
plot_qr(res,2) #The second explanatory variable
plot_qr(res,1,"s") #shrink_sf_SE
plot_qr(res,2,"s") #shrink_sf_alpha

###Not run
#res	<- resf_qr(y=y,x=x,meig=meig, boot=TRUE)
#res$B
#res$S
#res$e
#plot_qr(res,1) #The first explanatory vafriable (intercept)
#plot_qr(res,2) #The second explanatory variable
#plot_qr(res,1,"s") #shrink_sf_SE
#plot_qr(res,2,"s") #shrink_sf_alpha



