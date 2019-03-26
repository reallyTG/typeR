library(gclus)


### Name: cparcoord
### Title: Enhanced parallel coordinate plot
### Aliases: cparcoord
### Keywords: multivariate color hplot

### ** Examples

data(state)
state.m <- colpairs(state.x77, 
function(x,y)  cor.test(x,y,"two.sided","kendall")$estimate, diag=1)
# OR, Works only in R1.8,  state.m <-cor(state.x77,method="kendall")  


state.col <- dmat.color(state.m)

cparcoord(state.x77, panel.color= state.col)
# Get rid of the panels with lots of line crossings (yellow) by reordering:
cparcoord(state.x77, order.endlink(state.m), state.col)

# To get rid of the panels with lots of long line segments:
#  use a different panel merit measure- pclen:

mins <- apply(state.x77,2,min)
ranges <- apply(state.x77,2,max) - mins
state.m <- -colpairs(scale(state.x77,mins,ranges), pclen)
cparcoord(state.x77, order.endlink(state.m), dmat.color(state.m))






