library(colourvision)


### Name: plot3d.colourvision
### Title: Plot colour vision models into 3D chromaticity diagrams.
### Aliases: plot3d.colourvision

### ** Examples

## Not run: 
##D ##Photoreceptor sensitivity curves
##D C<-photor(lambda.max=c(350,420,490,560))
##D 
##D ##Gray background
##D Rb <- data.frame(300:700, rep(7, length(300:700)))
##D 
##D ## Read CIE D65 standard illuminant
##D data("D65")
##D 
##D ##Reflectance data
##D R1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
##D R1[,2]<-R1[,2]+10
##D 
##D ##Run models
##D model<-EMmodel(photo=4,
##D        R=R1, I=D65, Rb=Rb, C=C)
##D plot3d(model)
##D 
##D model<-CTTKmodel(photo=4,
##D        R=R1, I=D65, Rb=Rb, C=C)
##D plot3d(model)
##D 
##D model<-RNLmodel(photo=4, model="log",
##D        R1=R1, I=D65, Rb=Rb, C=C, noise=TRUE, e=c(0.13, 0.06, 0.12, 0.07))
##D plot3d(model, ylim=c(-6,6), xlim=c(-6,6))
## End(Not run)



