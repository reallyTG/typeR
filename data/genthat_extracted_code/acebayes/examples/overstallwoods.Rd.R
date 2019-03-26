library(acebayes)


### Name: overstallwoods
### Title: Functions implementing the examples of Overstall & Woods (2017).
### Aliases: utilcomp18bad optdescomp18bad utilcomp15bad optdescomp15bad
###   optdescomp15sig utilcomp15sig utilcomp15sigDRS optdescomp15sigDRS
###   utillrbad optdeslrbad utillrsig inideslrsig optdeslrsig utillrbaa
###   optdeslrbaa utillrnsel inideslrnsel optdeslrnsel utilhlrbad
###   optdeshlrbad utilhlrsig inideshlrsig optdeshlrsig utilhlrbaa
###   optdeshlrbaa utilhlrnsel inideshlrnsel optdeshlrnsel utilbeetle
###   optdesbeetle utillinmod optdeslinmod

### ** Examples


######## Compartmental model #################################

set.seed(1)
## Set seed for reproducibility

d<-optimumLHS(n = 18, k = 1) * 2 - 1
## Generate an 18-run design.

u<-utilcomp18bad(d = d, B = 20000)
## Calculate the D-optimal utility function for a 
## sample of size 20000. 

u[1:5]
## Look at first 5 elements.
#[1] 14.283473 10.525390  4.126233  7.061498 12.793245

d0<-optdescomp18bad( )
u0<-utilcomp18bad(d = d0, B = 20000)
## Optimal design found by ACE and calculate the D-optimal 
## utility function for a sample of size 20000.

u0[1:5]
## Look at first 5 elements.
#[1] 15.04721 15.37141 16.84287 14.06750 14.01523

mean(u)
mean(u0)
## Caluclate expected Bayesian D-optimal utility.

d<-matrix(runif(2), ncol = 1)
## Generate two beta parameters.

u<-utilcomp15sigDRS(d = d, B = 5)
u
## Calculate the SIG utility function for a 
## sample of size 5.
#[1] 17.652044  4.878998 19.919559 22.017760  5.600473

######## Logistic regression model ###########################

set.seed(1)
## Set seed for reproducibility

d<-optimumLHS(n = 16,k = 4) * 2 - 1
## Generate an 16-run design.

u<-utillrbad(d = d, B = 20000)
## Calculate the D-optimal utility function for a 
## sample of size 20000. 

u[1:5]
## Look at first 5 elements.
#[1] -11.426457  -5.925467  -9.238526  -9.392765  -7.689553

d0<-optdeslrbad(16)
u0<-utillrbad(d = d0, B = 20000)
## Optimal design found by ACE and calculate the D-optimal 
## utility function for a sample of size 20000.

u0[1:5]
## Look at first 5 elements.
#[1] -4.644116 -2.411431 -4.999891 -2.906558 -2.282687

mean(u)
mean(u0)
## Calculate expected Bayesian D-optimal utility.
#[1] -9.349215
#[1] -2.992012

######## Beetle mortality experiment #########################

set.seed(1)
## Set seed for repoducibility

d<-optimumLHS(n = 10, k = 1)*2-1
## Generate a design of 10 doses with elements in [-1, 1]

utilbeetle(d = d, B = 5)
## Calculate the utility function for a sample of size 5.

#-4.085626e-06 -1.209499e-06 -1.214244e-05 -6.243750e-06 -3.083291e-05

d0<-optdesbeetle(10)
d0
## Print out optimal design from Overstall & Woods (2017) for 10 doses 

0.5*( d0 + 1)*( 1.8839 - 1.6907 ) + 1.6907
## On original scale.
#          [,1]
# [1,] 1.769957
# [2,] 1.769520
# [3,] 1.768641
# [4,] 1.777851
# [5,] 1.768641
# [6,] 1.769520
# [7,] 1.777851
# [8,] 1.765997
# [9,] 1.768641
#[10,] 1.768641

######## Linear model ########################################

set.seed(1)
## Set seed for reproducibility

d<-cbind(rep(c( -1, 0, 1), each = 3), rep(c( -1, 0, 1), 3))
## Create a 9-run design which is the true D-optimal design

utillinmod(d = d, B = 5)
## Calculate the approximation to the true expected D-optimal utility 
## function for a sample of size 5. 

#[1]  7.926878  8.736976  7.717704 10.148613  8.882840

d0<-optdeslinmod(9)
## Optimal D-optimal design found using ACE

X<-cbind(1, d, d^2, d[,1] * d[,2])
X0<-cbind(1, d0, d0^2, d0[,1] * d0[,2])
## Calculate model matrices under both designs

detX<-determinant( t(X) %*% X)$modulus[1]
detX0<-determinant( t(X0) %*% X0)$modulus[1]
## Calculate true expected D-optimal utility function for both designs

100 * exp( 0.2 * ( detX0 - detX ))
## Calculate D-efficiency of ACE design.

# 99.93107



