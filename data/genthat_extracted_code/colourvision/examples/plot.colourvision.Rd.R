library(colourvision)


### Name: plot.colourvision
### Title: Plot colour vision models into chromaticity diagrams
### Aliases: plot.colourvision

### ** Examples

#trichromatic
##Photoreceptor sensitivity curves
C<-photor(lambda.max=c(350,450,550))

##Gray background
Rb <- data.frame(300:700, rep(7, length(300:700)))

## Read CIE D65 standard illuminant
data("D65")

##Reflectance data
R1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R1[,2]<-R1[,2]+10

##Run models
model<-EMmodel(photo=3,
       R=R1, I=D65, Rb=Rb, C=C)
plot(model)

model<-CTTKmodel(photo=3,
       R=R1, I=D65, Rb=Rb, C=C)
plot(model)

model<-RNLmodel(model="log", photo=3,
       R1=R1, I=D65, Rb=Rb, C=C, noise=TRUE, e=c(0.13, 0.06, 0.12))
plot(model)

#colour threshold
model<-RNLthres(photo=3, I=D65, Rb=Rb, C=C,
         noise=TRUE, e=c(0.13, 0.06, 0.12))
plot(model)

#dichromatic
##Photoreceptor sensitivity curves
C<-photor(lambda.max=c(400,550))

##Run models
model<-EMmodel(photo=2,
       R=R1, I=D65, Rb=Rb, C=C)
plot(model)

model<-EMmodel(photo=2, type="edge",
       R=R1, I=D65, Rb=Rb, C=C)
plot(model)

model<-CTTKmodel(photo=2,
       R=R1, I=D65, Rb=Rb, C=C)
plot(model)

model<-RNLmodel(model="log", photo=2,
       R1=R1, I=D65, Rb=Rb, C=C, noise=TRUE, e=c(0.13, 0.06))
plot(model)

#colour threshold
model<-RNLthres(photo=2, I=D65, Rb=Rb, C=C,
         noise=TRUE, e=c(0.13, 0.06))
plot(model)



