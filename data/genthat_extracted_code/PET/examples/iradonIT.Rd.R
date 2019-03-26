library(PET)


### Name: iradonIT
### Title: Iterative Inverse Radon Transformation
### Aliases: iradonIT
### Keywords: math smooth

### ** Examples

#    
# Compare the results of iterative reconstruction method "EM" and 
# direct reconstruction method "FB"
#
## Not run: 
##D P <- phantom(design="B")
##D rP <- markPoisson(P, nSample=1600000 )
##D irP1 <- iradon(rP$rData , nrow(P), ncol(P))
##D irP2 <- iradonIT(rP$rData , nrow(P), ncol(P))
##D viewData(list(P, rP$rData, irP1$irData, irP2$irData),
##D          list("Generated unnoisy Phantom", "Generated PET Data",
##D          "Direct rec.: mode='FB'", "Iterative rec.: mode='EM'"))
##D rm(irP1,irP2,P,rP)
## End(Not run)

#    
# Compare the results from the iterative reconstruction methods "EM"
# "CG" and "ART"
#
## Not run: 
##D P <- phantom(n=151, addIm="blurred1")
##D rP <- markPoisson(P, nSample=2000000, RhoSamples=401)
##D irP1 <- iradonIT(rP$rData , nrow(P), ncol(P), Iterations=20, 
##D         ConstrainMin=0, ConstrainMax=10)
##D irP2 <- iradonIT(rP$rData , nrow(P), ncol(P), mode="CG", 
##D         Iterations=4, ConstrainMin=0, ConstrainMax=10)
##D irP3 <- iradonIT(rP$rData , nrow(P), ncol(P), mode="ART", 
##D         Iterations=5, ConstrainMin=0, ConstrainMax=10, 
##D         Alpha=0.1, Beta=0.5)
##D viewData(list(P,irP1$irData,irP2$irData,irP3$irData),
##D          list("Generated unnoisy Phantom",
##D          "mode='EM', Iterations=20","mode='CG', Iterations=4", 
##D          "mode='ART', Iter.=20, Alpha=0.1, Beta=0.5"))
##D rm(irP1,irP2,irP3,P,rP)
## End(Not run)




