library(Frames2)


### Name: FB
### Title: Fuller-Burmeister estimator
### Aliases: FB

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate Fuller-Burmeister estimator for variable Clothing
FB(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$Domain, DatB$Domain)

#Now, let calculate Fuller-Burmeister estimator and a 90% confidence interval
#for variable Leisure, considering only first order inclusion probabilities
FB(DatA$Lei, DatB$Lei, DatA$ProbA, DatB$ProbB, DatA$Domain, 
DatB$Domain, 0.90)



