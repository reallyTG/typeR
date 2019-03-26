library(Phase123)


### Name: AssignEffTox
### Title: Determines the optimal dose to assign the next patient cohort.
### Aliases: AssignEffTox

### ** Examples

##Doses, YE,YT
Doses= c(1,1,1,2,2,2,1,1,1,3,3,3,1,1,1,2,2,2)
YE = c(0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,1,1,0)
YT=c(0,0,0,1,1,0,1,0,0,1,1,1,0,0,0,1,0,0)
##Vector of Numerical Doses
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
##Five doses, but only 3 tried so we have
DosesTried=c(1,1,1,0,0)
## Contour Vector
Contour = c(.35, .75,.7,.4)
##Hypermeans
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
##Acceptability Criteria
PiLim = c(.3,.4)
ProbLim=c(.1,.1)
##Number of iterations
B=2000
AssignEffTox(YE,YT, Doses, Dose, DosesTried, Hypermeans,  Hypervars, Contour, PiLim,  ProbLim, B )



