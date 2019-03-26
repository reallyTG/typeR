library(DySeq)


### Name: APIMtoTrans
### Title: APIMtoTrans
### Aliases: APIMtoTrans

### ** Examples


trans1<-APIMtoTrans(B0_1=0.1, AE_1=0.2, PE_1=0.3, Int_1=0.4,
                   B0_2=0.5, AE_2=0.6, PE_2=0.7, Int_2=0.8)

#inspecting the equivalent matrix
trans1

#backtesting by transforming the matrix back into beta-coefficients
round(TransToAPIM(trans1),6)




