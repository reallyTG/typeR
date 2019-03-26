library(candisc)


### Name: heplot.candisc
### Title: Canonical Discriminant HE plots
### Aliases: heplot.candisc heplot3d.candisc
### Keywords: multivariate hplot

### ** Examples

grass.mod <- lm(cbind(N1,N9,N27,N81,N243) ~ Block + Species, data=Grass)

grass.can1 <-candisc(grass.mod, term="Species")
grass.canL <-candiscList(grass.mod)

heplot(grass.can1, scale=6)
heplot(grass.can1, scale=6, terms=TRUE)
heplot(grass.canL, terms=TRUE, ask=FALSE)

## No test: 
 
heplot3d(grass.can1, wire=FALSE)
# compare with non-iso scaling
rgl::aspect3d(x=1,y=1,z=1)
# or,
# heplot3d(grass.can1, asp=NULL)
## End(No test)

## Pottery data, from car package
pottery.mod <- lm(cbind(Al, Fe, Mg, Ca, Na) ~ Site, data=Pottery)
pottery.can <-candisc(pottery.mod)

heplot(pottery.can, var.lwd=3)
heplot3d(pottery.can, var.lwd=3, scale=10, zlim=c(-3,3), wire=FALSE)

## No test: 
 
play3d(rgl::spin3d(axis = c(1, 0, 0), rpm = 5), duration=12)
## End(No test)

## FootHead data, from heplots package
## Not run: 
##D  
##D library(heplots)
##D data(FootHead)
##D 
##D # use Helmert contrasts for group
##D contrasts(FootHead$group) <- contr.helmert
##D 
##D foot.mod <- lm(cbind(width, circum,front.back,eye.top,ear.top,jaw)~group, data=FootHead)
##D foot.can <- candisc(foot.mod)
##D heplot(foot.can, main="Candisc HE plot", 
##D  hypotheses=list("group.1"="group1","group.2"="group2"),
##D  col=c("red", "blue", "green3", "green3" ), var.col="red")
## End(Not run)




