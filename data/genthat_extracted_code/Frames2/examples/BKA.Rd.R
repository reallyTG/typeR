library(Frames2)


### Name: BKA
### Title: Bankier-Kalton-Anderson estimator
### Aliases: BKA

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate BKA estimator for population total for variable Leisure
BKA(DatA$Lei, DatB$Lei, PiklA, PiklB, DatA$ProbB, DatB$ProbA, 
DatA$Domain, DatB$Domain)

#Now, let calculate BKA estimator and a 90% confidence interval for population 
#total for variable Feeding considering only first order inclusion probabilities
BKA(DatA$Feed, DatB$Feed, DatA$ProbA, DatB$ProbB, DatA$ProbB, 
DatB$ProbA, DatA$Domain, DatB$Domain, 0.90)



