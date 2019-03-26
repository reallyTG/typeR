library(colourvision)


### Name: RNLmodel
### Title: Receptor Noise Limited Models (Vorobyev & Osorio 1998)
### Aliases: RNLmodel

### ** Examples

#1
## Photoreceptor sensitivity spectra
##with lambda max at 350nm, 450nm and 550nm:
C<-photor(lambda.max=c(350,450,550))

##Grey background
##with 7 percent reflectance from 300 to 700nm:
Rb <- data.frame(300:700, rep(7, length(300:700)))

## Read CIE D65 standard illuminant:
data("D65")

##Reflectance data of R1 and R2
R1.1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R1.2<-logistic(x=seq(300,700,1), x0=400, L=50, k=0.04)
w<-R1.1[,1]
R1.1<-R1.1[,2]+10
R1.2<-R1.2[,2]+10
R1<-data.frame(w=w, R1.1=R1.1, R1.2=R1.2)

R2<-logistic(x=seq(300,700,1), x0=550, L=50, k=0.04)
R2[,2]<-R2[,2]+10

## Run model 
model<-RNLmodel(photo=3, model="log",
       R1=R1, R2=R2, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06, 0.12))
       
#plot       
plot(model)

#2
#Pentachromatic animal
## Photoreceptor sensitivity spectra
##with lambda max at 350,400,450,500,and 550nm:
C<-photor(lambda.max=c(350,400,450,500,550))

##Grey background
##with 7 percent reflectance from 300 to 700nm:
Rb <- data.frame(300:700, rep(7, length(300:700)))

## Read CIE D65 standard illuminant:
data("D65")

##Reflectance data of R1
R1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R1[,2]<-R1[,2]+10

#RNL model
RNLmodel(photo=5, model="log",
       R1=R1, R2=Rb, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06, 0.12, 0.07, 0.08))



