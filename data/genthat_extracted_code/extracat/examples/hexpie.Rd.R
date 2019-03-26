library(extracat)


### Name: hexpie
### Title: Hexagonal Binning and Piecharts
### Aliases: hexpie

### ** Examples

data(olives)
x <- olives$oleic
y <- olives$linoleic
z <- olives$Region

# the default
hexpie(x,y,z)

## Not run: 
##D # zooming in (transformation of the total number of obs in each bin)
##D hexpie(x,y,z, freq.trans=sqrt)
##D 
##D # circular shapes
##D hexpie(x,y,z, freq.trans=sqrt, shape="pie")
##D 
##D # classical piecharts
##D hexpie(x,y,z, freq.trans=sqrt, shape="pie", p.rule ="angles")
##D 
##D #  the total numbers of obs are reflected via alpha-blending, 
##D # the grid is not shown and RGB colors are used
##D hexpie(x,y,z, freq.trans=sqrt, shape="hex", p.rule ="radial",
##D  alpha.freq=TRUE, col ="rgb",show.hex=F)
##D 
##D hexpie(x,y,z, freq.trans=NULL, shape="hex", p.rule ="radial",
##D  alpha.freq=TRUE, col ="rgb",show.hex=T)
##D 
##D require(ggplot2)
##D data(diamonds)
##D x2 <- diamonds$carat
##D y2 <- diamonds$price
##D z2 <- diamonds$color
##D 
##D # a standard plot with colors via ggplot2
##D qplot(x2,y2,colour=z2)
##D 
##D # the hexpie version
##D hexpie(x2,y2,z2,n=36)
##D 
##D # due to the few bins with the majority of observations
##D # it is sensible to zoom in
##D hexpie(x2,y2,z2,n=36,freq.trans=function(s) log(1+s))
##D 
##D # the same, but this time the central color is the most frequent one
##D hexpie(x2,y2,z2,n=36,freq.trans=function(s) log(1+s), decr.by.rank = TRUE)
##D 
##D # this way the difference is more obvious
##D # (although the color palette is better suited for ordinal target variables)
##D 
##D mat.layout <- grid.layout(nrow = 1 , ncol = 2 , widths = c(1/2,1/2), heights=1)
##D grid.newpage()
##D vp.mat <- viewport(layout = mat.layout)
##D pushViewport(vp.mat)
##D 
##D vp1 <- viewport(layout.pos.row = 1, layout.pos.col = 1)
##D pushViewport(vp1)
##D 
##D hexpie(x2,y2,z2,n=18,freq.trans=NULL,
##D 	decr.by.rank=NULL,col="div", vp = vp1)
##D 	
##D vp2 <- viewport(layout.pos.row = 1, layout.pos.col = 2)
##D pushViewport(vp2)
##D 
##D hexpie(x2,y2,z2,n=18,freq.trans=NULL,
##D 	decr.by.rank=T,col="div", vp = vp1)
##D popViewport()
##D 
##D # random samples from the data (within bins) with many bins
##D # (takes some time)
##D require(scales)
##D grid.newpage()
##D hexpie(x2,y2,z2, freq.trans=function(s) log(1+s),random=1,
##D 	 n=240, show.hex=FALSE, col.opt=list(bg=alpha(1,0.7)),shape="c",col="rgb")
## End(Not run)



