library(DRIP)


### Name: roofEdge
### Title: Edge detection, denoising and deblurring
### Aliases: roofEdge
### Keywords: image processing, roof/valley edge detection

### ** Examples

data(peppers)
# Not run
#step.edges = stepEdgeLLK(peppers, bandwidth=6, thresh=25, plot=FALSE)
#roof.edges = roofEdge(image=peppers, bandwidth=9, thresh=3000, edge1=step.edges,
#     blur=FALSE, plot=FALSE) # Time consuming
#edges = step.edges + roof.edges     
#par(mfrow=c(2,2))
#image(1-step.edges, col=gray(0:1))
#image(1-roof.edges, col=gray(0:1))
#image(1-edges, col=gray(0:1))
#image(peppers, col=gray(c(0:255)/255))



