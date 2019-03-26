library(riverdist)


### Name: addverts
### Title: Add Vertices To Maintain a Minimum Distance Between Vertices
### Aliases: addverts

### ** Examples

data(Kenai3)
Kenai3split <- addverts(Kenai3,mindist=200)

zoomtoseg(seg=c(47,74,78), rivers=Kenai3)
points(Kenai3$lines[[74]])        # vertices before adding

zoomtoseg(seg=c(47,74,78), rivers=Kenai3split)
points(Kenai3split$lines[[74]])   # vertices after adding



