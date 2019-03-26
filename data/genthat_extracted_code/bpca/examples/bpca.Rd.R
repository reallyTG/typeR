library(bpca)


### Name: bpca
### Title: Biplot of Multivariate Data Based on Principal Components
###   Analysis
### Aliases: bpca bpca.default bpca.prcomp
### Keywords: multivariate

### ** Examples

##
## Example 1
## Computing and ploting a bpca object with 'graphics' package - 2d
##

bp <- bpca(gabriel1971)

dev.new(w=6, h=6)
oask <- devAskNewPage(dev.interactive(orNone=TRUE))
plot(bp,
     var.factor=2)

# Exploring the object 'bp' created by the function 'bpca'
class(bp)
names(bp)
str(bp)

summary(bp)
bp$call
bp$eigenval
bp$eigenvec
bp$numb
bp$import
bp$coord
bp$coord$obj
bp$coord$var
bp$var.rb
bp$var.rd

## Not run: 
##D ##
##D ## Example 2
##D ## Computing and plotting a bpca object with 'scatterplot3d' package - 3d
##D ##
##D 
##D bp <- bpca(gabriel1971,
##D            d=2:4)
##D 
##D plot(bp,
##D      var.factor=3,
##D      xlim=c(-2,2),
##D      ylim=c(-2,2),
##D      zlim=c(-2,2))
##D 
##D # Exploring the object 'bp' created by the function 'bpca'
##D class(bp)
##D names(bp)
##D str(bp)
##D 
##D summary(bp)
##D bp$call
##D bp$eigenval
##D bp$eigenvec
##D bp$numb
##D bp$import
##D bp$coord
##D bp$coord$obj
##D bp$coord$var
##D bp$var.rb
##D bp$var.rd
##D 
##D ##
##D ## Example 3
##D ## Computing and plotting a bpca object with 'rgl' package - 3d
##D ##
##D 
##D plot(bpca(gabriel1971,
##D           d=1:3),
##D      rgl.use=TRUE,
##D      var.factor=2)
##D 
##D # Suggestion: Interact with the graphic with the mouse
##D # left button: press, maintain and movement it to interactive rotation;
##D # right button: press, maintain and movement it to interactive zoom.
##D # Enjoy it!
##D 
##D ##
##D ## Example 4
##D ## Grouping objects with different symbols and colors - 2d and 3d
##D ##
##D 
##D # 2d
##D plot(bpca(iris[-5]),
##D      var.factor=.3,
##D      var.cex=.7,
##D      obj.names=FALSE,
##D      obj.cex=1.5,
##D      obj.col=c('red', 'green3', 'blue')[unclass(iris$Species)],
##D      obj.pch=c('+', '*', '-')[unclass(iris$Species)])
##D 
##D # 3d static
##D plot(bpca(iris[-5],
##D           d=1:3),
##D      var.factor=.2,
##D      var.color=c('blue', 'red'),
##D      var.cex=1,
##D      obj.names=FALSE,
##D      obj.cex=1,
##D      obj.col=c('red', 'green3', 'blue')[unclass(iris$Species)],
##D      obj.pch=c('+', '*', '-')[unclass(iris$Species)])
##D 
##D # 3d dynamic
##D plot(bpca(iris[-5],
##D           method='hj',
##D           d=1:3),
##D      rgl.use=TRUE,
##D      var.col='brown',
##D      var.factor=.3,
##D      var.cex=1.2,
##D      obj.names=FALSE,
##D      obj.cex=.8,
##D      obj.col=c('red', 'green3', 'orange')[unclass(iris$Species)],
##D      simple.axes=FALSE,
##D      box=TRUE)
## End(Not run)

devAskNewPage(oask)       



