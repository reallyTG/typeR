library(bpca)


### Name: var.rdf
### Title: Diagnostic of Projected Correlations
### Aliases: var.rdf
### Keywords: multivariate

### ** Examples

##
## Example 1
## Diagnostic of gabriel1971 dataset representation
##

oask <- devAskNewPage(dev.interactive(orNone=TRUE))

bp1 <- bpca(gabriel1971,
            meth='hj',
            var.rb=TRUE)

(res <- var.rdf(gabriel1971,
                bp1$var.rb,
                lim=3))
class(res)

##
## Example 2
## Diagnostic of gabriel1971 dataset representation with var.rd parameter
##

bp2 <- bpca(gabriel1971,
            meth='hj',
            var.rb=TRUE,
            var.rd=TRUE,
            limit=3)

plot(bp2,
     var.factor=2)

bp2$var.rd

bp2$eigenvectors

# Graphical visualization of the importance of the variables not contemplated
# in the reduction
plot(bpca(gabriel1971,
          meth='hj',
          d=3:4),
     main='hj',
     xlim=c(-1,1),
     ylim=c(-1,1))

# Interpretation:
# RUR followed by CRISTIAN contains information dimensions that
# wasn't contemplated by the biplot reduction (PC3).
# Between all, RUR followed by CRISTIAN, variables are the most poor represented
# by a 2d biplot.

## Not run: 
##D ##
##D ## Example 3
##D ## Diagnostic of iris dataset representation with var.rd parameter
##D ##
##D 
##D bp3 <- bpca(iris[-5],
##D             var.rb=TRUE,
##D             var.rd=TRUE,
##D             limit=3)
##D 
##D plot(bp3,
##D      obj.col=c('red', 'green3', 'blue')[unclass(iris$Species)],
##D      var.factor=.3)
##D 
##D bp3$var.rd
##D bp3$eigenvectors
##D 
##D # Graphical diagnostic
##D plot(bpca(iris[-5],
##D           d=3:4),
##D      obj.col=c('red', 'green3', 'blue')[unclass(iris$Species)],
##D      obj.names=FALSE,
##D      var.factor=.6,
##D      xlim=c(-2,3),
##D      ylim=c(-1,1))
##D 
##D # Interpretation:
##D # Sepal.length followed by Petal.Width contains information in dimensions
##D # (PC3 - the PC3 is, essentially, a contrast among both) that wasn't fully
##D # contemplated by the biplot reduction (PC1 and PC2) .
##D # Therefore, between all variables, they have the most poor representation by a
##D # 2d biplot.
##D 
##D bp4 <- bpca(iris[-5],
##D             d=1:3,
##D             var.rb=TRUE,
##D             var.rd=TRUE,
##D             limit=2)
##D 
##D plot(bp4,
##D      obj.names=FALSE,
##D      obj.pch=c('+', '-', '*')[unclass(iris$Species)],
##D      obj.col=c('red', 'green3', 'blue')[unclass(iris$Species)],
##D      obj.cex=1,
##D      xlim=c(-5,5),
##D      ylim=c(-5,5),
##D      zlim=c(-5,5),
##D      var.factor=.5)
##D 
##D bp4$var.rd
##D bp4$eigenvectors
##D 
##D round(bp3$var.rb, 2)
##D 
##D round(cor(iris[-5]), 2)
##D 
##D # Good representation of all variables with a 3d biplot!
## End(Not run)

devAskNewPage(oask)



