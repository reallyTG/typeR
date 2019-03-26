library(FBFsearch)


### Name: FBF_RS
### Title: Moment Fractional Bayes Factor Stochastic Search for Regression
###   Models
### Aliases: FBF_RS
### Keywords: multivariate models dag stochastic search

### ** Examples


## Not run: 

data(SimDag6) 

Corr=dataSim6$SimCorr[[1]]
nobs=50
q=ncol(Corr)
Gt=dataSim6$TDag

Res_search=FBF_RS(Corr, nobs, matrix(0,1,(q-1)), 1, 0.01, 1000, 10)
M_q=Res_search$M_q
M_G=Res_search$M_G
M_P=Res_search$M_P


Mt=rev(matrix(Gt[1:(q-1),q],1,(q-1))) #True Model

M_med=M_q
M_med[M_q>=0.5]=1
M_med[M_q<0.5]=0 #median probability model

#Structural Hamming Distance between the true DAG and the median probability DAG
sum(sum(abs(M_med-Mt))) 

## End(Not run)




