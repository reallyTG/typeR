library(FBFsearch)


### Name: FBF_GS
### Title: Moment Fractional Bayes Factor Stochastic Search with Global
###   Prior for Gaussian DAG Models
### Aliases: FBF_GS
### Keywords: multivariate models dag stochastic search

### ** Examples


## Not run:

data(SimDag6) 

Corr=dataSim6$SimCorr[[1]]
nobs=50
q=ncol(Corr)
Gt=dataSim6$TDag

Res_search=FBF_GS(Corr, nobs, matrix(0,q,q), 1, 0.01, 1000, 10)
M_q=Res_search$M_q
M_G=Res_search$M_G
M_P=Res_search$M_P

G_med=M_q
G_med[M_q>=0.5]=1
G_med[M_q<0.5]=0 #median probability DAG

G_high=M_G[1:q,1:q] #Highest Posterior Probability DAG (HPP)
pp_high=M_P[1] #Posterior Probability of the HPP

#Structural Hamming Distance between the true DAG and the median probability DAG
sum(sum(abs(G_med-Gt)))
#Structural Hamming Distance between the true DAG and the highest probability DAG 
sum(sum(abs(G_high-Gt)))

## End(Not run) 





