library(pdR)


### Name: ipsHEGY
### Title: IPS-HEGY seasonal unit root test in panel data, Otero et
###   al.(2007).
### Aliases: ipsHEGY

### ** Examples

data(inf_Q)
dataz<-inf_Q
itsd<-c(1,0,c(1:3))
#Seasonal dummy only takes quarters 1:3, 
#becasue of the presence of common intercept.
Sel<-"bic" # "aic","bic", "signf".
pmax<-12

OUT<-ipsHEGY(dataz,itsd,Sel,pmax,CIPS=FALSE)
OUT$P_HEGY
OUT$U_HEGY

# Simulation of critical values








