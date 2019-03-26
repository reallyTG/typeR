library(Thermimage)


### Name: Te
### Title: Operative temperature estimate.
### Aliases: Te

### ** Examples


# Example

Ts<-40
Ta<-30
SE<-seq(0,1500,100)
Toperative<-NULL
for(rho in seq(0, 1, 0.1)){
  temp<-Te(Ts=Ts, Ta=Ta, Tg=NULL, RH=0.5, E=0.96, rho=rho, cloud=1, SE=SE, V=0.1, 
           L=0.1, type="free", shape="hcylinder")
  Toperative<-cbind(Toperative, temp)
}
Toperative<-data.frame(SE=seq(0,1500,100), Toperative)
colnames(Toperative)<-c("SE", seq(0,1,0.1))
matplot(Toperative$SE, Toperative[,-1], ylim=c(30, 50), type="l", xlim=c(0,1000),
        ylab="Operative Temperature (C)", xlab="Solar Radiation (W/m2)", lty=1,
        col=flirpal[rev(seq(1,380,35))])

# For detailed examples and explanations, see:
# https://github.com/gtatters/Thermimage/blob/master/HeatTransferCalculations.md





