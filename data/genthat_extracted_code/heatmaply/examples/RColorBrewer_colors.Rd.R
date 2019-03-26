library(heatmaply)


### Name: RColorBrewer_colors
### Title: RColorBrewer color Ramp Palette
### Aliases: RColorBrewer_colors BrBG PiYG PRGn PuOr RdBu RdGy RdYlBu
###   RdYlGn Spectral Blues BuGn BuPu GnBu Greens Greys Oranges OrRd PuBu
###   PuBuGn PuRd Purples RdPu Reds YlGn YlGnBu YlOrBr YlOrRd cool_warm

### ** Examples

## Not run: 
##D 
##D library(RColorBrewer)
##D display.brewer.all(n=11,type="div"); title(main = "Divergent color palette")
##D display.brewer.all(n=9,type=c("seq")); title(main = "Sequential color palette")
##D 
##D 
##D 
##D img <- function(obj, nam) {
##D   image(1:length(obj), 1, as.matrix(1:length(obj)), col=obj,
##D         main = nam, ylab = "", xaxt = "n", yaxt = "n",  bty = "n")
##D }
##D 
##D par(mfrow = c(10,1))
##D img(rev(cool_warm(500)), "cool_warm, (Moreland 2009)")
##D img(RdBu(500), "RdBu")
##D img(BrBG(500), "BrBG")
##D img(PiYG(500), "PiYG")
##D img(PRGn(500), "PRGn")
##D img(PuOr(500), "PuOr")
##D img(RdGy(500), "RdGy")
##D img(RdYlBu(500), "RdYlBu")
##D img(RdYlGn(500), "RdYlGn")
##D img(Spectral(500), "Spectral")
##D 
##D 
##D library(heatmaply)
##D heatmaply(cor(mtcars), colors = PiYG, limits = c(-1,1))
##D heatmaply(cor(mtcars), colors = RdBu, limits = c(-1,1))
##D 
## End(Not run)



