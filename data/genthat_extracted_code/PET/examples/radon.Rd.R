library(PET)


### Name: radon
### Title: Radon Transformation
### Aliases: radon
### Keywords: math smooth

### ** Examples

P <- phantom()
R1 <- radon(P)
R2 <- radon(P, DeltaRho=0.5)
R3 <- radon(P, RhoSamples=501)
R4 <- radon(P, RhoSamples=251, RhoMin=-125, DeltaRho=1)
R5 <- radon(P, RhoSamples=451, RhoMin=-225, DeltaRho=1)
viewData(list(P, R1$rData, R2$rData, R3$rData, R4$rData, R5$rData), 
         list("Phantom P with 256x256 voxels", "Default sinogram of P", 
              "DeltaRho=0.5", "RhoSamples=501", 
              "RhoSamples=251, RhoMin=-125, DeltaRho=1",
              "RhoSamples=451, RhoMin=-225, DeltaRho=1"))
rm(P,R1,R2,R3,R4,R5)



