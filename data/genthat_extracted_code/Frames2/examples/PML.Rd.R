library(Frames2)


### Name: PML
### Title: Pseudo Maximum Likelihood estimator
### Aliases: PML

### ** Examples

data(DatA)
data(DatB)
data(PiklA)
data(PiklB)

#Let calculate Pseudo Maximum Likelihood estimator for population total for variable Clothing
PML(DatA$Clo, DatB$Clo, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B = 1191)

#Now, let calculate Pseudo Maximum Likelihood estimator for population total for variable
#Feeding, using first order inclusion probabilities
PML(DatA$Feed, DatB$Feed, DatA$ProbA, DatB$ProbB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B = 1191)

#Finally, let calculate Pseudo Maximum Likelihood estimator and a 90% confidence interval for 
#population total for variable Leisure
PML(DatA$Lei, DatB$Lei, PiklA, PiklB, DatA$Domain, DatB$Domain, 
N_A = 1735, N_B = 1191, 0.90)



