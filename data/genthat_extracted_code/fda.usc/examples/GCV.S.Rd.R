library(fda.usc)


### Name: GCV.S
### Title: The generalized cross-validation (GCV) score.
### Aliases: GCV.S
### Keywords: utilities

### ** Examples


data(phoneme)
mlearn<-phoneme$learn
tt<-1:ncol(mlearn)
S1 <- S.NW(tt,2.5)
S2 <- S.LLR(tt,2.5)
gcv1 <- GCV.S(mlearn, S1)
gcv2 <- GCV.S(mlearn, S2)
gcv3 <- GCV.S(mlearn, S1,criteria="AIC")
gcv4 <- GCV.S(mlearn, S2,criteria="AIC")
gcv1; gcv2; gcv3; gcv4
 


