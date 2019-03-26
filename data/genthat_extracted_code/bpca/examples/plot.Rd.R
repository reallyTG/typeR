library(bpca)


### Name: plot
### Title: Biplot of Multivariate Data Based on Principal Components
###   Analysis
### Aliases: plot.bpca.2d plot.bpca.3d plot.qbpca
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

# Additional graphical parameters (nonsense)
plot(bpca(gabriel1971,
          meth='sqrt'),
     main='gabriel1971 - sqrt',
     sub='The graphical parameters are working fine!',
     var.factor=2,
     var.cex=.6,
     var.col=rainbow(9),
     var.pch='v',
     obj.pch='o',
     obj.cex=.5,
     obj.col=rainbow(8),
     obj.pos=1,
     obj.offset=.5)

##
## Example 2
## Computing and plotting a bpca object with 'scatterplot3d' package - 3d
##

bp <- bpca(gabriel1971,
           d=1:3)

plot(bp,
     var.factor=3)

# Additional graphical parameters (nonsense)
plot(bpca(gabriel1971,
          d=1:3,
          meth='jk'),
     main='gabriel1971 - jk',
     sub='The graphical parameters are working fine!',
     var.factor=6,
     var.pch='+',
     var.cex=.6,
     var.col='green4',
     obj.pch='*',
     obj.cex=.8,
     obj.col=1:8,
     ref.lty='solid',
     ref.col='red',
     angle=70)

##
## Example 3
## Computing and plotting a bpca object with 'rgl' package - 3d
##

plot(bpca(gabriel1971,
          d=1:3),
     rgl.use=TRUE,
     var.factor=2)

# Suggestion: Interact with the graphic with the mouse
# left button: press, maintain and movement it to interactive rotation;
# right button: press, maintain and movement it to interactive zoom.
# Enjoy it!

## Not run: 
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
##D      simple.axes=FALSE, box=TRUE)
##D 
##D ##
##D ## Example 5
##D ## Computing and plotting a bpca object with 'obj.identify=TRUE' parameter - 2d
##D ##
##D 
##D bp <- bpca(gabriel1971)
##D 
##D # Normal labels
##D if(interactive())
##D plot(bp,
##D      obj.names=FALSE,
##D      obj.identify=TRUE)
##D 
##D # Alternative labels
##D if(interactive())
##D plot(bp,
##D      obj.names=FALSE,
##D      obj.labels=c('toi', 'kit', 'bat', 'ele', 'wat', 'rad', 'tv', 'ref'),
##D      obj.identify=TRUE)
##D 
##D ##
##D ## Example 6
##D ## Computing and plotting a bpca object with 'obj.identify=TRUE' parameter - 3d
##D ##
##D 
##D bp <- bpca(gabriel1971,
##D            d=1:3)
##D 
##D # Normal labels
##D if(interactive())
##D plot(bp,
##D      obj.names=FALSE,
##D      obj.identify=TRUE)
##D 
##D # Alternative labels
##D if(interactive())
##D plot(bp,
##D      obj.names=FALSE,
##D      obj.labels=c('toi', 'kit', 'bat', 'ele', 'wat', 'rad', 'tv', 'ref'),
##D      obj.identify=TRUE)
##D 
##D ##
##D ## New options plotting
##D ##
##D plot(bpca(ontario))
##D 
##D # Labels for all objects
##D (obj.lab <- paste('g',
##D                   1:18,
##D                   sep=''))
##D 
##D # Giving obj.labels
##D plot(bpca(ontario),
##D     obj.labels=obj.lab) 
##D 
##D # Evaluate an object (1 is the default)
##D plot(bpca(ontario),
##D      type='eo',
##D      obj.cex=1)
##D 
##D plot(bpca(ontario),
##D      type='eo',
##D      obj.id=7,
##D      obj.cex=1)
##D 
##D # Giving obj.labels
##D plot(bpca(ontario),
##D      type='eo',
##D      obj.labels=obj.lab,
##D      obj.id=7,
##D      obj.cex=1)
##D 
##D # The same as above
##D plot(bpca(ontario),
##D      type='eo',
##D      obj.labels=obj.lab,
##D      obj.id='g7',
##D      obj.cex=1)
##D 
##D # Evaluate a variable (1 is the default)
##D plot(bpca(ontario),
##D      type='ev',
##D      var.pos=2,
##D      var.cex=1)
##D 
##D plot(bpca(ontario),
##D      type='ev',
##D      var.id='E7',
##D      obj.labels=obj.lab,
##D      var.pos=1,
##D      var.cex=1)
##D 
##D # A complete plot
##D cl <- 1:3
##D plot(bpca(iris[-5]),
##D      type='ev',
##D      var.id=1,
##D      var.fac=.3,
##D      obj.names=FALSE,
##D      obj.col=cl[unclass(iris$Species)])
##D legend('topleft',
##D        legend=levels(iris$Species),
##D        text.col=cl,
##D        pch=19,
##D        col=cl,
##D        cex=.9,
##D        box.lty=0)   
##D 
##D # Compare two objects (1 and 2 are the default)
##D plot(bpca(ontario), 
##D      type='co',
##D      c.radio=.4,
##D      c.color='blue',
##D      c.lwd=2)
##D 
##D plot(bpca(ontario),
##D      type='co',
##D      obj.labels=obj.lab,
##D      c.radio=.5,
##D      c.color='blue',
##D      c.lwd=2)
##D 
##D plot(bpca(ontario),
##D      type='co',
##D      obj.labels=obj.lab,
##D      obj.id=13:14)
##D 
##D plot(bpca(ontario),
##D      type='co',
##D      obj.labels=obj.lab,
##D      obj.id=c('g7', 
##D               'g13'))
##D 
##D # Compare two variables
##D plot(bpca(ontario),
##D      type='cv',
##D      c.number=3,
##D      c.radio=1.5)
##D 
##D # Which won where/what
##D plot(bpca(ontario),
##D      type='ww')
##D 
##D # Discrimitiveness vs. representativeness
##D plot(bpca(ontario),
##D      type='dv')
##D 
##D plot(bpca(ontario),
##D      type='dv',
##D      c.number=4,
##D      c.radio=1)
##D 
##D # Means vs. stability
##D plot(bpca(ontario),
##D      type='ms')
##D 
##D plot(bpca(ontario),
##D      type='ms',
##D      c.number=3)
##D 
##D # Rank objects with ref. to the ideal variable 
##D plot(bpca(ontario),
##D      type='ro')
##D 
##D plot(bpca(ontario),
##D      type='ro',
##D      c.number=6,
##D      c.radio=.5)
##D 
##D # Rank variables with ref. to the ideal object
##D plot(bpca(ontario),
##D      type='rv')
##D 
##D plot(bpca(ontario),
##D      type='rv',
##D      c.number=6,
##D      c.radio=.5)
##D 
##D plot(bpca(iris[-5]),
##D      type='eo',
##D      obj.id=42,
##D      obj.cex=1)
##D 
##D plot(bpca(iris[-5]),
##D      type='ev',
##D      var.id='Sepal.Width')
##D 
##D plot(bpca(iris[-5]),
##D      type='ev',
##D      var.id='Sepal.Width',
##D      var.factor=.3)
## End(Not run)

devAskNewPage(oask)



