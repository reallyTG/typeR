library(FBFsearch)


### Name: FBF_LS
### Title: Moment Fractional Bayes Factor Stochastic Search with Local
###   Prior for DAG Models
### Aliases: FBF_LS
### Keywords: multivariate models dag stochastic search

### ** Examples


## Not run:

data(SimDag6) 

Corr=dataSim6$SimCorr[[1]]
nobs=50
q=ncol(Corr)
Gt=dataSim6$TDag

M_q=FBF_LS(Corr, nobs, matrix(0,q,q), 0, 0.01, 1000)

G_med=M_q
G_med[M_q>=0.5]=1
G_med[M_q<0.5]=0 #median probability DAG

#Structural Hamming Distance between the true DAG and the median probability DAG
sum(sum(abs(G_med-Gt))) 

## End(Not run)




