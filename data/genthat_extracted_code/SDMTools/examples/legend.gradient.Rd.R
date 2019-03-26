library(SDMTools)


### Name: legend.gradient
### Title: Legend Gradient
### Aliases: legend.gradient

### ** Examples

#define a simple binary matrix
tmat = { matrix(c( 0,0,0,1,0,0,1,1,0,1,
                   0,0,1,0,1,0,0,0,0,0,
                   0,1,NA,1,0,1,0,0,0,1,
                   1,0,1,1,1,0,1,0,0,1,
                   0,1,0,1,0,1,0,0,0,1,
                   0,0,1,0,1,0,0,1,1,0,
                   1,0,0,1,0,0,1,0,0,0,
                   0,1,0,0,0,1,0,NA,NA,NA,
                   0,0,1,1,1,0,0,NA,NA,NA,
                   1,1,1,0,0,0,0,NA,NA,NA),nr=10,byrow=TRUE) }

#do the connected component labeling
tasc = ConnCompLabel(tmat)

# Create a color ramp
colormap=c("grey","yellow","yellowgreen","olivedrab1","lightblue4")

#create an image
image(tasc,col=colormap, axes=FALSE, xlab="", ylab="", ann=FALSE)

#points for the gradient legend
pnts = cbind(x =c(0.8,0.9,0.9,0.8), y =c(1.0,1.0,0.8,0.8))

#create the gradient legend
legend.gradient(pnts,colormap,c("Low","High"))



