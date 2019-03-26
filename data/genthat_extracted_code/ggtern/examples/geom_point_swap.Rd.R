library(ggtern)


### Name: geom_point_swap
### Title: Points (Colour and Fill Swapped), as for a scatterplot
### Aliases: geom_point_swap GeomPointSwap
### Keywords: datasets

### ** Examples

data(Feldspar)
ggtern(Feldspar,aes(Ab,An,Or)) + 
stat_confidence_tern(geom='polygon',aes(fill=..level..),color='white') + 
geom_mask() + 
geom_point_swap(aes(colour=T.C,shape=Feldspar),fill='black',size=5) +
scale_shape_manual(values=c(21,24)) +
scale_color_gradient(low='green',high='red') +
labs(title="Feldspar",color="Temperature",fill='Confidence')



