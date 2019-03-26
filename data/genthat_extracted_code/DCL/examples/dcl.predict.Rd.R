library(DCL)


### Name: dcl.predict
### Title: Pointwise predictions (RBNS/IBNR split)
### Aliases: dcl.predict
### Keywords: htest

### ** Examples

## Data application by in Martinez-Miranda, Nielsen and Verrall (2012)

data(NtriangleDCL)
data(XtriangleDCL)

# Estimation of the DCL parameters described 
est<-dcl.estimation(XtriangleDCL,NtriangleDCL)

# with general delay parameters and ignoring Ntriangle to reproduce exactly chain ladder
pred1<-dcl.predict(dcl.par=est,Model=1,Tail=FALSE)

# with Modeled parameters (distributional Model) and ignoring Ntriangle
pred2<-dcl.predict(dcl.par=est,Model=2,Tail=FALSE)

# with Modeled parameters (distributional Model) using observed Ntriangle
pred3<-dcl.predict(dcl.par=est,Ntriangle=NtriangleDCL,Model=2,Tail=FALSE)

# providing the Tail, with Modeled parameters (distributional Model)
pred4<-dcl.predict(dcl.par=est,Ntriangle=NtriangleDCL,Model=2,Tail=TRUE)




