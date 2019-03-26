library(imager)


### Name: px.flood
### Title: Select a region of homogeneous colour
### Aliases: px.flood

### ** Examples

#Select part of a sail 
px <- px.flood(boats,x=169,y=179,sigma=.2) 
plot(boats)
highlight(px)



