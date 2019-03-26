library(SparseTSCGM)


### Name: SparseTSCGM-package
### Title: Sparse Time Series Chain Graphical Models.
### Aliases: SparseTSCGM-package SparseTSCGM
### Keywords: package

### ** Examples


seed = 321
datas <- sim.data(model="ar1", time=10,n.obs=10, n.var=5,seed=seed,prob0=0.35,
         network="random")
data.fit <-  datas$data1
prec_true <- datas$theta
autoR_true <- datas$gamma
    
   
res.tscgm <- sparse.tscgm(data=data.fit, lam1=NULL, lam2=NULL, nlambda=NULL, 
 model="ar1", penalty="scad", optimality="bic_mod",
 control=list(maxit.out = 10, maxit.in = 100))
   
#Estimated sparse precision and autoregression matrices
prec <- res.tscgm$theta
autoR <- res.tscgm$gamma

#Graphical visualization
par(mfrow=c(2,2))
plot.tscgm(datas, mat="precision",main="True precision matrix")         
plot.tscgm(res.tscgm, mat="precision",main="Estimated precision matrix")     
plot.tscgm(datas, mat="autoregression",main="True autoregression coef. matrix")    
plot.tscgm(res.tscgm, mat="autoregression",
           main="Estimated autoregression coef. matrix") 
  



