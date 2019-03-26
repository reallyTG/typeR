library(Frames2)


### Name: Hartley
### Title: Hartley estimator
### Aliases: Hartley

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate Hartley estimator for variable Feeding
Hartley(DatA$Feed, DatB$Feed, PiklA, PiklB, DatA$Domain, DatB$Domain)

#Now, let calculate Hartley estimator and a 90% confidence interval
#for variable Leisure, considering only first order inclusion probabilities
Hartley(DatA$Lei, DatB$Lei, DatA$ProbA, DatB$ProbB, DatA$Domain, 
DatB$Domain, 0.90)



