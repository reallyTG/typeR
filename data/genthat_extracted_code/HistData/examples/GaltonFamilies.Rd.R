library(HistData)


### Name: GaltonFamilies
### Title: Galton's data on the heights of parents and their children, by
###   child
### Aliases: GaltonFamilies
### Keywords: datasets

### ** Examples

data(GaltonFamilies)
str(GaltonFamilies)

## reproduce Fig 2 in Hanley (2004)
library(car)
scatterplot(childHeight ~ midparentHeight | gender, data=GaltonFamilies, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

# multiply daughters' heights by 1.08
GF1 <- within(GaltonFamilies, 
              {childHeight <- ifelse (gender=="female", 1.08*childHeight, childHeight)} )
scatterplot(childHeight ~ midparentHeight | gender, data=GF1, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

# add 5.2 to daughters' heights 
GF2 <- within(GaltonFamilies, 
              {childHeight <- ifelse (gender=="female", childHeight+5.2, childHeight)} )
scatterplot(childHeight ~ midparentHeight | gender, data=GF2, 
    ellipse=TRUE, levels=0.68, legend.coords=list(x=64, y=78))

#########################################
# relationship between heights of parents
#########################################

Parents <- subset(GaltonFamilies, !duplicated(GaltonFamilies$family))

with(Parents, {
  sunflowerplot(mother, father, rotate=TRUE, pch=16, 
     xlab="Mother height", ylab="Father height")
	dataEllipse(mother, father, add=TRUE, plot.points=FALSE, 
     center.pch=NULL, levels=0.68)
	abline(lm(father ~ mother), col="red", lwd=2)
	}
	)




