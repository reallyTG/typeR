library(Frames2)


### Name: CalSF
### Title: SF calibration estimator
### Aliases: CalSF

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate SF calibration estimator for variable Clothing, without
#considering any auxiliary information
CalSF(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain)

#Now, let calculate SF calibration estimator for variable Leisure when the frame
#sizes and the overlap domain size are known
CalSF(DatA$Lei, DatB$Lei, PiklA, PiklB, DatA$ProbB, DatB$ProbA, DatA$Domain, 
DatB$Domain, N_A = 1735, N_B = 1191, N_ab = 601)

#Finally, let calculate SF calibration estimator and a 90% confidence interval
#for population total for variable Feeding, considering Income and Metres2 as auxiliary 
#variables and with frame sizes and overlap domain size known.
CalSF(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$ProbB, DatB$ProbA, DatA$Domain, 
DatB$Domain, N_A = 1735, N_B =  1191, N_ab = 601, xsAFrameA = DatA$Inc, 
xsBFrameA = DatB$Inc, xsAFrameB = DatA$M2, xsBFrameB = DatB$M2, 
XA = 4300260, XB = 176553, conf_level = 0.90)



