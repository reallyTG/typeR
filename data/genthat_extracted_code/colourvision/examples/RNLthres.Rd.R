library(colourvision)


### Name: RNLthres
### Title: Colour thresholds based on the Receptor Noise Limited Model
###   (Vorobyev & Osorio 1998).
### Aliases: RNLthres

### ** Examples

###Bee photoreceptors normalized to max=1.
data("bee")
C<-bee
C[,2]<-C[,2]/max(C[,2])
C[,3]<-C[,3]/max(C[,3])
C[,4]<-C[,4]/max(C[,4])

##Grey background:
Rb <- data.frame(300:700, rep(0.1, length(300:700)))

## CIE D65 illuminant:
data("D65")

#Thresholds
thres<-RNLthres(photo=3, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06, 0.12))

plot(thres)     



