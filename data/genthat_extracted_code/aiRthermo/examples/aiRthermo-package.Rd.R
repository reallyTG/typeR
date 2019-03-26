library(aiRthermo)


### Name: aiRthermo-package
### Title: Atmospheric Thermodynamics and Visualization
### Aliases: aiRthermo-package aiRthermo
### Keywords: Package

### ** Examples


# CAPE, CIN index
data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
aws<-RadiosondeA[,6]/1000
capeCin<-CAPE_CIN(PlowTop=98000,precoolType="adiabatic",
                  Ps=aPs,Ts=aTs,ws=aws,doLog=0,deltaP=5,
                  getLiftedBack=TRUE,upToTop=TRUE)
print(min(capeCin$CAPE))


pdf("stuve.pdf")
stuveA<-stuve_diagram(Pres = aPs/100,Temp=aTs-273.15)
lines(capeCin$Tl-273.15,capeCin$Pl/100,col="red",lwd=2)
dev.off()

# Adiabatic Ascent
P0<-101325
T0<-273.15
w0<-0.0025
adiabEvol<-adiabatic_ascent(P0,T0,w0,50000,5)




