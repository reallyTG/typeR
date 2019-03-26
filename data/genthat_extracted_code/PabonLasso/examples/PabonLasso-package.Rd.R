library(PabonLasso)


### Name: PabonLasso-package
### Title: Pabon Lasso Graphs and Comparing Situations of a Unit in Two
###   Different Times
### Aliases: PabonLasso-package PabonLasso
### Keywords: Pabon Lasso Graph BioStatistics

### ** Examples

## Assigning the BOR1, BTR1, BOR2, BTR2 vectors

BOR1=c(72.54,48.86,42.77,40.81,60,28.61,20.29,12.84,100,47.07,78.51,45,49,20,88,90)
BTR1=c(12.05,12.5,6.83,4.35,5.33,7.77,6.28,2.73,35.07,13.23,12.21,12,4,5,25,16)
BOR2=c(40,55.37,80,17.33,40,84,57.91,9.73,30,34.09,57.52,50,55,30,35,20)
BTR2=c(15.22,15.58,6.52,2.35,10.75,25,27.11,1.867,9,9.695,11.20,5,14,25,23,26)

pl(BOR1,BTR1,BOR2,BTR2,MainLabel1="Feb 2013 ",MainLabel2="Feb 2014 ",HA1="BOR 2013",
HA2="BOR 2014",VA1="BTR 2013",VA2="BTR 2014")



