library(agridat)


### Name: crossa.wheat
### Title: Multi-environment trial of wheat for 18 genotypes at 25
###   locations
### Aliases: crossa.wheat
### Keywords: datasets

### ** Examples

## Not run: 
##D 
##D library(agridat)
##D data(crossa.wheat)
##D dat <- crossa.wheat
##D 
##D # AMMI biplot.  Fig 3 of Crossa et al.
##D require(agricolae)
##D m1 <- with(dat, AMMI(E=loc, G=gen, R=1, Y=yield))
##D b1 <- m1$biplot[,1:4]
##D b1$PC1 <- -1 * b1$PC1 # Flip vertical
##D plot(b1$yield, b1$PC1, cex=0.0,
##D      text(b1$yield, b1$PC1, cex=.5, labels=row.names(b1),col="brown"),
##D      main="crossa.wheat AMMI biplot",
##D      xlab="Average yield", ylab="PC1", frame=TRUE)
##D mn <- mean(b1$yield)
##D abline(h=0, v=mn, col='wheat')
##D 
##D g1 <- subset(b1,type=="GEN")
##D text(g1$yield, g1$PC1, rownames(g1), col="darkgreen", cex=.5)
##D 
##D e1 <- subset(b1,type=="ENV")
##D arrows(mn, 0,
##D        0.95*(e1$yield - mn) + mn, 0.95*e1$PC1,
##D        col= "brown", lwd=1.8,length=0.1)
##D 
##D # GGB example
##D library(agridat)
##D data(crossa.wheat)
##D dat2 <- crossa.wheat
##D library(gge)
##D # Specify env.group as column in data frame
##D m2 <- gge(yield~gen*loc, dat2, env.group=locgroup, scale=FALSE)
##D biplot(m2, main="crossa.wheat - GGB biplot")
##D 
## End(Not run)



