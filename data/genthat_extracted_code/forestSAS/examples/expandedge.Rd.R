library(forestSAS)


### Name: expandedge
### Title: Expand the edges for the point pattern with replication.
### Aliases: expandedge

### ** Examples

library(spatstat)
data(finpines)
finpines$window
# window: rectangle = [-5, 5] x [-8, 2] metres

# Expand the rectangle [-5,5]x[-8,2] to [-6,6]x[-9,3]
Expand.trees<- expandedge(finpines,xwidth=2,ywidth=1,id=1:126)
Expand.trees

# Show the changes by figures
opar<-par(mfrow=c(1,2))
plot(finpines$x,finpines$y)
text(finpines$x,finpines$y,1:126)
plot(Expand.trees$x,Expand.trees$y)
text(Expand.trees$x,Expand.trees$y,Expand.trees$old.id)
rect(-5,-8,5,2,border="red")
par(opar)



