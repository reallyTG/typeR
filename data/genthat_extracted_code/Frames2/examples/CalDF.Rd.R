library(Frames2)


### Name: CalDF
### Title: DF calibration estimator
### Aliases: CalDF

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate DF calibration estimator for variable Feeding, without
#considering any auxiliary information
CalDF(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$Domain, DatB$Domain)

#Now, let calculate DF calibration estimator for variable Clothing when the frame
#sizes and the overlap domain size are known
CalDF(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B = 1191, N_ab = 601)

#Finally, let calculate DF calibration estimator and a 90% confidence interval
#for population total for variable Feeding, considering Income as auxiliary variable in 
#frame A and Metres2 as auxiliary variable in frame B and with frame sizes and overlap 
#domain size known.
CalDF(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B =  1191, N_ab = 601, xsAFrameA = DatA$Inc, xsBFrameA = DatB$Inc, 
xsAFrameB = DatA$M2, xsBFrameB = DatB$M2, XA = 4300260, XB = 176553, 
conf_level = 0.90)



