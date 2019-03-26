library(Frames2)


### Name: PEL
### Title: Pseudo empirical likelihood estimator
### Aliases: PEL

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate pseudo empirical likelihood estimator for variable Feeding, without
#considering any auxiliary information
PEL(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$Domain, DatB$Domain)

#Now, let calculate pseudo empirical estimator for variable Clothing when the frame
#sizes and the overlap domain size are known
PEL(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B = 1191, N_ab = 601)

#Finally, let calculate pseudo empirical likelihood estimator and a 90% confidence interval
#for population total for variable Feeding, considering Income and Metres2 as auxiliary 
#variables and with frame sizes and overlap domain size known.
PEL(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B =  1191, N_ab = 601, xsAFrameA = DatA$Inc, xsBFrameA = DatB$Inc, 
xsAFrameB = DatA$M2, xsBFrameB = DatB$M2, XA = 4300260, XB = 176553, 
conf_level = 0.90)



