library(forestSAS)


### Name: shrinkedge
### Title: Shrink the edges for the point pattern
### Aliases: shrinkedge

### ** Examples

library(spatstat)
data(finpines)
finpines$window
# window: rectangle = [-5, 5] x [-8, 2] metres

#Shrink the rectangle [-5,5]x[-8,2] to [-3,3]x[-5,-1]
shrink.trees<- shrinkedge(finpines,xwidth=2,ywidth=3,id=1:126)
shrink.trees

# Show the changes by figures
opar<-par(mfrow=c(1,2))
plot(finpines$x,finpines$y)
text(finpines$x,finpines$y,1:126)
rect(-3,-5,3,-1,border="red")
plot(shrink.trees$x,shrink.trees$y)
text(shrink.trees$x,shrink.trees$y,shrink.trees$old.id)
par(opar)



