library(sensitivitymw)


### Name: senmw
### Title: Sensitivity analysis in observational studies using weighted
###   Huber-Maritz M-statistics.
### Aliases: senmw

### ** Examples

#Illustrates greater insensitivity reported when weights are use.
data(mercury)
senmw(mercury,gamma=15)
senmw(mercury,method="h",gamma=15)
senmw(mercury,method="w",gamma=15)
senmw(mercury,method="w",gamma=19)
senmw(mercury,method="l",gamma=20)

#Reproduces Table 2, row gamma=15 of Rosenbaum (2014).  
senmw(mercury,gamma=15,m1=1,m2=1,m=1)
senmw(mercury,gamma=15,m1=2,m2=2,m=2)
senmw(mercury,gamma=15,m1=12,m2=20,m=20)
senmw(mercury,gamma=15,m1=14,m2=20,m=20)
senmw(mercury,gamma=15,m1=16,m2=20,m=20)
senmw(mercury,gamma=15,m1=12,m2=19,m=20)
senmw(mercury,gamma=15,m1=14,m2=19,m=20)
senmw(mercury,gamma=15,m1=16,m2=19,m=20)

#Reproduces part of Table 1 in Rosenbaum (2007).  For other parts of this table, see help(senmwCI).
data(erpcp)
senmw(erpcp,gamma=2,trim=1,inner=0,m1=1,m2=1,m=1)
senmw(erpcp,gamma=3,trim=1,inner=0,m1=1,m2=1,m=1)
senmw(erpcp,gamma=4,trim=1,inner=0,m1=1,m2=1,m=1)



