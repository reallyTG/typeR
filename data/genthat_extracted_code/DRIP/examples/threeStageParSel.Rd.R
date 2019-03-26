library(DRIP)


### Name: threeStageParSel
### Title: image denoising/deblurring, bandwidth selection, bootstrap
### Aliases: threeStageParSel
### Keywords: Bandwidth Selection, Cross Validation (CV)

### ** Examples

data(peppers) # Peppers image is bundled with the package and it is a
          # standard test image in image processing literature.
# Not run
#step.edges = stepEdgeLLK(peppers, 9, 17) # Step edge detection
#roof.edges = roofEdge(peppers, 6, 3000, edge1=step.edges) # Roof edge detection
#parSel = threeStageParSel(image=peppers, edge1=step.edges,
#edge2=roof.edges, bandwidth=4:5) # Time consuming



