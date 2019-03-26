library(SparseTSCGM)


### Name: plot.tscgm
### Title: Plot sparse.tscgm objects from fitting chain graphical models
###   with vector autoregressive process of order 2.
### Aliases: plot.tscgm

### ** Examples


seed = 321
datas <- sim.data(model="ar1", time=10,n.obs=10, n.var=5,seed=seed,prob0=0.35,
         network="random")
data.fit <-  datas$data1

 res.tscgm <- sparse.tscgm(data=data.fit, lam1=NULL, lam2=NULL, nlambda=NULL, 
 model="ar1", penalty="scad",optimality="bic_mod",control=list(maxit.out = 10, maxit.in = 100))
  
#Network visualization
 par(mfrow=c(2,1))
plot.tscgm(res.tscgm, mat="precision", main="Undirected network", pad = 0.01,
  label.pad = 0.3, label.col = 6, vertex.col = 5,vertex.cex = 1.5,
  edge.col = 4, mode = "fruchtermanreingold", interactive=FALSE)
       
plot.tscgm(res.tscgm, mat="autoregression", main="Directed network", pad = 0.01,
  label.pad = 0.3, label.col = 6, vertex.col = 5,vertex.cex = 1.5,
  edge.col = 4, mode = "fruchtermanreingold", interactive=FALSE)
  




