library(Frames2)


### Name: WeightsCalSF
### Title: g-weights for the SF calibration estimator
### Aliases: WeightsCalSF

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate g-weights for the SF calibration estimator for variable Clothing,
#without considering any auxiliary information
WeightsCalSF(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain)

#Now, let calculate g-weights for the SF calibration estimator for variable Leisure
#when the frame sizes and the overlap domain size are known
WeightsCalSF(DatA$Lei, DatB$Lei, PiklA, PiklB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain, N_A = 1735, N_B = 1191, N_ab = 601)

#Finally, let calculate g-weights for the SF calibration estimator
#for variable Feeding, considering Income and Metres2 as auxiliary 
#variables and with frame sizes and overlap domain size known.
WeightsCalSF(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain, N_A = 1735, N_B =  1191, N_ab = 601, xsAFrameA = DatA$Inc, 
xsBFrameA = DatB$Inc, xsAFrameB = DatA$M2, xsBFrameB = DatB$M2, 
XA = 4300260, XB = 176553)



