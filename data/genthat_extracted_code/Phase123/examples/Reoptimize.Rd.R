library(Phase123)


### Name: Reoptimize
### Title: Gives the Optimal Dose for enrolling next patient cohort.
### Aliases: Reoptimize

### ** Examples

##Doses, YE,YT
Doses= c(1,1,1,2,2,2,1,1,1,3,3,3,1,1,1,2,2,2)
YE = c(0,0,1,1,1,0,0,0,0,1,1,1,0,0,1,1,1,0)
YT=c(0,0,0,1,1,0,1,0,0,1,1,1,0,0,0,1,0,0)
Y=rexp(length(YE))
I=rbinom(length(YE),1,.9)
##Vector of Numerical Doses
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
##Hypermeans for Eff-Tox
Hypermeans = c(.022,3.45,0,-4.23,3.1,0)
Hypervars = c(2.6761, 2.6852, .2, 3.1304, 3.1165, 1)
Hypervars=Hypervars^2
###Number of iterations
B=20000
Reoptimize(Y,I,YE,YT, Doses, Dose, Hypermeans,  Hypervars,B)



