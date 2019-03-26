library(SparseTSCGM)


### Name: plot.tscgm.ar2
### Title: Plot sparse.tscgm objects from fitting chain graphical models
###   with vector autoregressive process of order 2.
### Aliases: plot.tscgm.ar2

### ** Examples

## Data generation from time series chain graphical model with vector 
## autoregressive model of order 2
seed = 321
datas <- sim.data(model="ar2", time=10,n.obs=20, n.var=5,seed=seed,prob0=0.35,
         network="random")
data.fit <-  datas$data1

## Model fitting with vector autoregressive order 2
 res.tscgm <- sparse.tscgm(data=data.fit, lam1=NULL, lam2=NULL, nlambda=NULL, 
 model="ar2", penalty="scad",optimality="bic_mod",control=list(maxit.out = 10, maxit.in = 100))
  
#Network visualization
 par(mfrow=c(3,2))

#Graphical visualization
par(mfrow=c(3,2))
plot.tscgm.ar2(datas, mat="precision",main="True precision matrix")         
plot.tscgm.ar2(res.tscgm, mat="precision",main="Estimated precision matrix")
     
plot.tscgm.ar2(datas, mat="autoregression1", 
        main="True autoregression coef. matrix of lag 1" )    
plot.tscgm.ar2(res.tscgm, mat="autoregression1",
           main="Estimated autoregression coef. matrix of lag 1")
            
plot.tscgm.ar2(datas, mat="autoregression2",
      main="True autoregression coef. matrix of lag 2")    
plot.tscgm.ar2(res.tscgm, mat="autoregression2",
           main="Estimated autoregression coef. matrix of lag 2") 
  




