library(icosa)


### Name: locate
### Title: Basic lookup function of coordinates on an icosahedral grid
### Aliases: locate locate,hexagrid-method locate,trigrid-method

### ** Examples

# create a grid 
g <- trigrid(4)
# some random points
randomPoints<-rpsphere(4, output="polar")
# cells
locate(g, randomPoints)



