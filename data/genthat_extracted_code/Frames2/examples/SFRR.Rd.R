library(Frames2)


### Name: SFRR
### Title: Raking ratio estimator
### Aliases: SFRR

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate raking ratio estimator for population total for variable Clothing
SFRR(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$ProbB, DatB$ProbA, DatA$Domain, 
DatB$Domain, 1735, 1191)

#Now, let calculate raking ratio estimator and a 90% confidence interval for 
#population total for variable Feeding, considering only first order inclusion probabilities
SFRR(DatA$Feed, DatB$Feed, DatA$ProbA, DatB$ProbB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain, 1735, 1191, 0.90)



