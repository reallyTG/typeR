library(birdring)


### Name: draw.recmap
### Title: Plot ringing data
### Aliases: draw.recmap
### Keywords: graphics

### ** Examples

data(lancol)
draw.recmap(lancol,lines=2,border='gray',subset="ring=='13B...6919'",gcircle=TRUE,zoom=3)

## Not run: 
##D draw.recmap(lancol,points=0.5,pcol='blue',density=TRUE, bbox=c(-5,20, 47,58),
##D   projection='mercator',all.data=TRUE)
##D draw.recmap(lancol,'d:/example.png',points=1,pcol=c('red','blue','black'),
##D   group='sex.byringer',legend='bottomleft',labels=c('Female','Male','Unknown'),title='Sex')
## End(Not run)





