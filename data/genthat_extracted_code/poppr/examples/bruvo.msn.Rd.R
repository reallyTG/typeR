library(poppr)


### Name: bruvo.msn
### Title: Create minimum spanning network of selected populations using
###   Bruvo's distance.
### Aliases: bruvo.msn msn.bruvo

### ** Examples


# Load the data set.
data(nancycats)

# View populations 8 and 9 with default colors. 
bruvo.msn(nancycats, replen = rep(2, 9), sublist=8:9, vertex.label="inds", 
          vertex.label.cex=0.7, vertex.label.dist=0.4)
## Not run: 
##D # View heat colors.
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette=heat.colors, vertex.label.cex=0.7, vertex.label.dist=0.4)
##D 
##D # View custom colors. Here, we use black and orange.
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette = colorRampPalette(c("orange", "black")), vertex.label.cex=0.7, 
##D vertex.label.dist=0.4)
##D 
##D # View with darker shades of grey (setting the upper limit to 1/2 black 1/2 white).
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette = colorRampPalette(c("orange", "black")), vertex.label.cex=0.7, 
##D vertex.label.dist=0.4, glim=c(0, 0.5))
##D 
##D # View with no grey scaling.
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette = colorRampPalette(c("orange", "black")), vertex.label.cex=0.7, 
##D vertex.label.dist=0.4, gscale=FALSE)
##D 
##D # View with no line widths.
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette = colorRampPalette(c("orange", "black")), vertex.label.cex=0.7, 
##D vertex.label.dist=0.4, wscale=FALSE)
##D 
##D # View with no scaling at all.
##D bruvo.msn(nancycats, replen=rep(2, 9), sublist=8:9, vertex.label="inds", 
##D palette = colorRampPalette(c("orange", "black")), vertex.label.cex=0.7, 
##D vertex.label.dist=0.4, gscale=FALSE)
##D 
##D # View the whole population, but without labels.
##D bruvo.msn(nancycats, replen=rep(2, 9), vertex.label=NA)
## End(Not run)



