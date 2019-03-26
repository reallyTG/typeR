library(colourvision)


### Name: RNLplot
### Title: Receptor noise limited model 2D and 1D plot
### Aliases: RNLplot

### ** Examples

#dichromat
C<-photor(lambda.max=c(450,550))
Rb <- data.frame(300:700, rep(7, length(300:700)))
data("D65")
R1.1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R1.2<-logistic(x=seq(300,700,1), x0=400, L=50, k=0.04)
w<-R1.1[,1]
R1.1<-R1.1[,2]+10
R1.2<-R1.2[,2]+10
R1<-data.frame(w=w, R1.1=R1.1, R1.2=R1.2)
model<-RNLmodel(model="log",
       R1=R1, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06))
plot(model)

#trichromat
C<-photor(lambda.max=c(350,450,550))
Rb <- data.frame(300:700, rep(7, length(300:700)))
data("D65")
R1.1<-logistic(x=seq(300,700,1), x0=500, L=50, k=0.04)
R1.2<-logistic(x=seq(300,700,1), x0=400, L=50, k=0.04)
w<-R1.1[,1]
R1.1<-R1.1[,2]+10
R1.2<-R1.2[,2]+10
R1<-data.frame(w=w, R1.1=R1.1, R1.2=R1.2)
model<-RNLmodel(model="log",
       R1=R1, Rb=Rb, I=D65, C=C,
       noise=TRUE, e = c(0.13, 0.06, 0.12))
plot(model)



