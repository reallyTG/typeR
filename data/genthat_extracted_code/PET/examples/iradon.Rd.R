library(PET)


### Name: iradon
### Title: Direct Inverse Radon Transformation
### Aliases: iradon
### Keywords: math smooth

### ** Examples

#    
# Compare the results of different direct reconstruction methods
#
## Not run: 
##D P <- phantom(design="B")
##D rP <- markPoisson(P, nSample=3000000 )
##D irP1 <- iradon(rP$rData , nrow(P), ncol(P))
##D irP2 <- iradon(rP$rData , nrow(P), ncol(P), 
##D         mode="BF", DebugLevel="HardCore")
##D irP3 <- iradon(rP$rData , nrow(P), ncol(P), 
##D         mode="CBF", DebugLevel="HardCore")
##D viewData(list(rP$rData, irP1$irData, irP2$irData, irP3$irData),
##D          list("Generated PET Data", "Reconstruction: mode='FB'", 
##D          "Reconstruction: mode='BF'", "Reconstruction: mode='CBF'"))
##D rm(irP1,irP2,irP3,P,rP)
## End(Not run)

#    
# Compare the results of different values for RhoSamples in 'markPoisson'
#
## Not run: 
##D P <- phantom()
##D rP1 <- markPoisson(P, nSample=1000000, RhoSamples=101, image=FALSE)
##D rP2 <- markPoisson(P, nSample=1000000, RhoSamples=256, image=FALSE)
##D rP3 <- markPoisson(P, nSample=1000000, RhoSamples=501, image=FALSE)
##D rP4 <- markPoisson(P, nSample=1000000, RhoSamples=801, image=FALSE)
##D irP1 <- iradon(rP1$rData, 257, 257)
##D irP2 <- iradon(rP2$rData, 257, 257, DebugLevel="HardCore")
##D irP3 <- iradon(rP3$rData, 257, 257, DebugLevel="HardCore")
##D irP4 <- iradon(rP4$rData, 257, 257, DebugLevel="HardCore")
##D viewData(list(irP1$irData, irP2$irData, irP3$irData, irP4$irData,),
##D          list("RhoSamples=101",  "RhoSamples=256", "RhoSamples=501",
##D          "RhoSamples=801"))
##D rm(P,rP1,rP2,rP3,rP4,irP1,irP2,irP3,irP4)
## End(Not run)

# 
# mode="Test"
#
P <- phantom()
R <- radon(P)
iradon(R$rData, XSamples=257, YSamples=257, mode="Test", oData=P)
rm(P,R)



