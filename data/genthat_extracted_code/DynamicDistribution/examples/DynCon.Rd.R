library(DynamicDistribution)


### Name: DynCon
### Title: Dynamically Visualized Continuous Probability Distributions and
###   Their Moments
### Aliases: DynCon

### ** Examples
DynCon(name=Lognormal,par_matrix=matrix(c(0,2,1,2),2,2),
choice='cdf',const_par=c(0,1))

DynCon(name=Inverse_Gaussian,par_matrix=matrix(c(1,12,10,20),2,2)
,choice='Kurtosis',const_par=c(2,3))

DynCon(name=Exponential,par_matrix=matrix(c(1,20),2,1),choice=
'Skewness')

DynCon(name=Normal,par_matrix=matrix(c(1,20,10,20),2,2),choice=
'Variance',const_par=c(0,1))

DynCon(name=Logistic,par_matrix=matrix(c(1,12,10,20),2,2),choice
='Kurtosis',const_par=c(2,3))



