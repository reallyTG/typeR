library(colourvision)


### Name: EMmodel
### Title: Endler and Mielke (2005) colour vision model
### Aliases: EMmodel

### ** Examples

##Photoreceptor sensitivity curves
##with lambda max at 350nm, 450nm and 550nm:
C<-photor(lambda.max=c(350,450,550))

##Gray background
##with 7 percent reflectance from 300 to 700nm:
Rb <- data.frame(300:700, rep(7, length(300:700)))

## Read CIE D65 standard illuminant
data("D65")

##Reflectance data
## with a sigmoid spectrum and midpoint at 500nm and 550 nm
R1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R2<-logistic(x=seq(300,700,1), x0=550, L=50, k=0.04)
R<-cbind(R1, R2[,2])
R[,2]<-R[,2]+10
R[,3]<-R[,3]+10

## Run model 
model<-EMmodel(photo=3, type="edge",
       R=R, I=D65, Rb=Rb, C=C)

plot(model)



