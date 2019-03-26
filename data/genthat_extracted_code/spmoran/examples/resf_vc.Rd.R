library(spmoran)


### Name: resf_vc
### Title: Spatially varying coefficient modeling with automatic
###   coefficient selection
### Aliases: resf_vc

### ** Examples

require(spdep)
data(boston)
y	<- boston.c[, "CMEDV"]
x       <- boston.c[,c("ZN", "INDUS" ,"LSTAT")]
xconst  <- boston.c[,c("CRIM", "NOX", "CHAS", "AGE", "DIS", "RAD", "TAX", "PTRATIO", "B", "RM" )]
coords<- boston.c[,c("LAT","LON")]

meig 	<- meigen(coords=coords)
# meig_f 	<- meigen_f(coords=coords)  ## for fast computation

res	  <- resf_vc(y=y,x=x,xconst=xconst,meig=meig)
res$b
res$s
res$e

res$vc
res$b_vc[1:10,]
res$bse_vc[1:10,]
res$t_vc[1:10,]
res$p_vc[1:10,]

###Plot the first SVC (INDUS)
#
#require(ggplot2)
#ggplot(mapping = aes(x = coords$LON, y = coords$LAT)) +
#  geom_point(aes(colour = res$b_vc[,3])) +
#  scale_color_gradientn(colours=rev(rainbow(4)))



