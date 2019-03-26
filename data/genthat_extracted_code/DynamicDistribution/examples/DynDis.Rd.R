library(DynamicDistribution)


### Name: DynDis
### Title: Dynamically Visualized Discrete Probability Distributions and
###   Their Moments
### Aliases: DynDis

### ** Examples

DynDis(name=Negative_Binomial,par_matrix=matrix(c(1,12,0.1,0.9),2,2)
,choice='Kurtosis',const_par=c(4,0.7))

DynDis(name=Bernoulli,par_matrix=matrix(c(0.1,0.9),2,1),choice='cdf')

DynDis(name=Binomial,par_matrix=matrix(c(1,12,0.1,0.9),2,2),choice='Mean'
,const_par=c(4,0.7))

DynDis(name=Logarithmic_Series,par_matrix=matrix(c(0.1,0.9),2,1),
choice='Variance')

DynDis(name=Geometric,par_matrix=matrix(c(0.1,0.9),2,1),choice='Skewness')

DynDis(name=Hypergeometric,par_matrix=matrix(c(1,3,2,8,10,20),2,3),
choice='Kurtosis',const_par=c(4,5,6))

DynDis(name=Dis_Uniform,par_matrix=matrix(c(2,5),2,1),choice='Skewness')

DynDis(name=Poisson,par_matrix=matrix(c(2,20),2,1),choice='Kurtosis')



