library(penDvine)


### Name: penDvine-package
### Title: The package 'penDvine' offers routines for estimating densities
###   and copula distribution of D-vines.
### Aliases: penDvine-package

### ** Examples

#This examples describes the estimation of a D-vine to winddata,
#available in this package. After the margins are prepared, we estimate a
#D-vine using B-splines with 9 (K+1) marginal knots and penalizing second (m=2)
#order differences (pen=1) of the basis coefficients.

data(Winddata)
ex.data<-Winddata[c(1:100),c(1:4)] #examplary subdata for fast calculation
wind.example<-Dvine(ex.data,K=7,pen=1,lambda=100,order.Dvine=FALSE,base="B-spline",m=2,cores=2)
  


