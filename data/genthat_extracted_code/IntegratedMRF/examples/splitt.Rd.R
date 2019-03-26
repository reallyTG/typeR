library(IntegratedMRF)


### Name: splitt
### Title: Split of the Parent node
### Aliases: splitt

### ** Examples

library(IntegratedMRF)
X=matrix(runif(20*100),20,100)
Y=matrix(runif(20*3),20,3)
m_feature=5
Index=1:20
Inv_Cov_Y=solve(cov(Y))
ff2 = ncol(X) # number of features
ff =sort(sample(ff2, m_feature)) 
Command=2#MRF, as number of output feature is greater than 1
Split_criteria=splitt(X,Y,m_feature,Index,Inv_Cov_Y,Command,ff) 



