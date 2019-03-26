library(bpca)


### Name: bpca-package
### Title: Biplot of Multivariate Data Based on Principal Components
###   Analysis
### Aliases: bpca-package
### Keywords: package multivariate

### ** Examples

##
## Grouping objects with different symbols and colors - 2d and 3d
##

dev.new(w=6, h=6)
oask <- devAskNewPage(dev.interactive(orNone=TRUE))

## Not run: 
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

##
## New options plotting
##
plot(bpca(ontario))

# Labels for all objects
(obj.lab <- paste('g',
                  1:18,
                  sep=''))

# Giving obj.labels
plot(bpca(ontario),
    obj.labels=obj.lab) 

# Evaluate an object (1 is the default)
plot(bpca(ontario),
     type='eo',
     obj.cex=1)

plot(bpca(ontario),
     type='eo',
     obj.id=7,
     obj.cex=1)

# Giving obj.labels
plot(bpca(ontario),
     type='eo',
     obj.labels=obj.lab,
     obj.id=7,
     obj.cex=1)

# The same as above
plot(bpca(ontario),
     type='eo',
     obj.labels=obj.lab,
     obj.id='g7',
     obj.cex=1)

# Evaluate a variable (1 is the default)
plot(bpca(ontario),
     type='ev',
     var.pos=2,
     var.cex=1)

plot(bpca(ontario),
     type='ev',
     var.id='E7',
     obj.labels=obj.lab,
     var.pos=1,
     var.cex=1)

# A complete plot
cl <- 1:3
plot(bpca(iris[-5]),
     type='ev',
     var.id=1,
     var.fac=.3,
     obj.names=FALSE,
     obj.col=cl[unclass(iris$Species)])

legend('topleft',
       legend=levels(iris$Species),
       text.col=cl,
       pch=19,
       col=cl,
       cex=.9,
       box.lty=0)   

# Compare two objects (1 and 2 are the default)
plot(bpca(ontario),
     type='co')

plot(bpca(ontario),
     type='co',
     obj.labels=obj.lab)

plot(bpca(ontario),
     type='co',
     obj.labels=obj.lab,
     obj.id=13:14)

plot(bpca(ontario),
     type='co',
     obj.labels=obj.lab,
     obj.id=c('g7', 'g13'))

# Compare two variables
plot(bpca(ontario),
     type='cv')

# Which won where/what
plot(bpca(ontario),
     type='ww')

# Discrimitiveness vs. representativeness
plot(bpca(ontario),
     type='dv')

# Means vs. stability
plot(bpca(ontario),
     type='ms')

# Rank objects with ref. to the ideal variable 
plot(bpca(ontario),
     type='ro')

# Rank variables with ref. to the ideal object
plot(bpca(ontario),
     type='rv')

## Not run: 
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



