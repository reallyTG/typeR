library(kequate)


### Name: getSeeirt
### Title: Retrieve Standard Errors of Equating From an IRT-Equating
### Aliases: getSeeirt getSeeirt-class getSeeirt,keout-method

### ** Examples

irtmatX<-matrix(0, 4, 3)
irtmatX[,1]<-c(0.1, 0.3, 0.2, 0.5)
irtmatX[,2]<-c(0.2, 0.5, 0.4, 0.7)
irtmatX[,3]<-c(0.3, 0.7, 0.6, 0.9)
irtmatY<-matrix(0, 4, 3)
irtmatY[,1]<-c(0.15, 0.2, 0.1, 0.4)
irtmatY[,2]<-c(0.2, 0.4, 0.3, 0.6)
irtmatY[,3]<-c(0.25, 0.6, 0.5, 0.8)
irtX<-c(12, 32, 54, 22, 10)
irtY<-c(24, 36, 48, 12, 10)
xirt=0:4
glmXirt<-glm(irtX~xirt+I(xirt^2), family="poisson", x=TRUE)
glmYirt<-glm(irtY~xirt+I(xirt^2), family="poisson", x=TRUE)
keEGirt<-kequate("EG", 0:4, 0:4, glmXirt, glmYirt, irtx=irtmatX, irty=irtmatY)
getSeeirt(keEGirt)



