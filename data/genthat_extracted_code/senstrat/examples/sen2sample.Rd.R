library(senstrat)


### Name: sen2sample
### Title: Treatment versus control sensitivity analysis without strata.
### Aliases: sen2sample
### Keywords: htest robust

### ** Examples


mercury<-c(5.3, 15, 11, 5.8, 17, 7, 8.5, 9.4, 7.8, 12, 8.7, 4, 3, 12.2, 6.1, 10.2,
           100, 70, 196, 69, 370, 270, 150, 60, 330, 1100, 40, 100, 70,
           150, 200, 304, 236, 178, 41, 120, 330, 62, 12.8)
z<-c(rep(0,16),rep(1,23))
CuCells<-c(2.7, .5, 0, 0, 5, 0, 0, 1.3, 0, 1.8, 0, 0, 1.0, 1.8,
           0, 3.1, .7, 4.6, 0, 1.7, 5.2, 0, 5, 9.5, 2, 3, 1, 3.5,
           2, 5, 5.5, 2, 3, 4, 0, 2, 2.2, 0, 2)

#Reproduces Rosenbaum and Krieger (1990), page 497
sen2sample(rank(mercury),z,gamma=5)
#Reproduces Rosenbaum and Krieger (1990), page 497
sen2sample(rank(CuCells),z,gamma=2)
(551.500000-492.334479)/sqrt(1153.775252) #Computation of the deviate
#Intermediate calculations: expectation and variance are in row 21.
evall(rank(CuCells),z,2,method="RK")

#The following three examples, if run, reproduce the
#calculations in the final paragraph of page 145,
#Section 4.6.6 of Rosenbaum (2002) Observational Studies, 2nd Ed.
#The first calculation uses large sample approximations
#to expectations and variances.
sen2sample(rank(mercury),z,gamma=2,method="LS")
#The next two calculations use exact expectations and variances
sen2sample(rank(mercury),z,gamma=2,method="RK")
sen2sample(rank(mercury),z,gamma=2,method="BU")



