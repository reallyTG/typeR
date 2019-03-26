library(aqp)


### Name: soil_minerals
### Title: Munsell Colors of Common Soil Minerals
### Aliases: soil_minerals
### Keywords: datasets

### ** Examples

## Not run: 
##D library(aqp)
##D library(ape)
##D library(cluster)
##D library(colorspace)
##D 
##D # load common soil mineral colors
##D data(soil_minerals)
##D # convert Munsell to R colors
##D soil_minerals$col <- munsell2rgb(soil_minerals$hue, soil_minerals$value, 
##D soil_minerals$chroma)
##D 
##D # make a grid for plotting
##D n <- ceiling(sqrt(nrow(soil_minerals)))
##D # read from top-left to bottom-right
##D g <- expand.grid(x=1:n, y=n:1)[1:nrow(soil_minerals),]
##D 
##D # convert Munsell -> sRGB -> LAB
##D col.rgb <- munsell2rgb(soil_minerals$hue, soil_minerals$value, 
##D soil_minerals$chroma, return_triplets = TRUE)
##D col.lab <- as(sRGB(as.matrix(col.rgb)), 'LAB')@coords
##D row.names(col.lab) <- soil_minerals$mineral
##D 
##D # divisive hierarchical clustering of LAB coordinates
##D d <- daisy(col.lab)
##D h <- as.hclust(diana(d))
##D p <- as.phylo(h)
##D 
##D # plot grid of mineral names / colors
##D layout(matrix(c(1,2), nrow=1), widths = c(1.25,1))
##D par(mar=c(1,0,0,1))
##D plot(g$x, g$y, pch=15, cex=12, axes=FALSE, xlab='', ylab='', 
##D col=rev(soil_minerals$col[h$order]), xlim=c(0.5,5.5), ylim=c(1.5,5.5))
##D text(g$x, g$y, rev(soil_minerals$mineral[h$order]), adj=c(0.45,5), cex=1, font=2)
##D text(g$x, g$y, rev(soil_minerals$color[h$order]), col='white', pos=1, cex=0.85, font=2)
##D title(main='Common Soil Minerals', line=-2, cex.main=2)
##D mtext('http://www.nrcs.usda.gov/wps/portal/nrcs/detail/soils/edu/?cid=nrcs142p2_054286', 
##D side=1, cex=0.75, line=-1.5)
##D mtext('U. Schwertmann, 1993. SSSA Special Publication no. 31, pages 51--69', side=1, 
##D cex=0.75, line=-0.5)
##D 
##D # dendrogram + tip labels with mineral colors
##D plot(p, cex=0.85, label.offset=1, font=1)
##D tiplabels(pch=15, cex=4, col=soil_minerals$col)
##D 
## End(Not run)




