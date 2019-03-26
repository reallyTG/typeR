library(colourvision)


### Name: colourvision-package
### Title: Colour Vision Models
### Aliases: colourvision-package colourvision
### Keywords: package

### ** Examples

##Honeybee photoreceptor sensitivity curves
data("bee")

##Grey background:
## with 10 percent. reflectance from 300 to 700nm:
Rb <- data.frame(300:700, rep(10, length(300:700)))

## Read CIE D65 standard illuminant already converted to quantum flux:
data("D65")

##Reflectance data
## with a sigmoid spectrum and midpoint at 500nm and 550 nm
R1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R2<-logistic(x=seq(300,700,1), x0=550, L=50, k=0.04)
R<-cbind(R1, R2[,2])

## Run colour vision model:
model<-CTTKmodel(photo="tri", R=R, I=D65, Rb=Rb,
C=bee)

##plot data in the colour space
plot(model)



