library(space)


### Name: space.joint
### Title: A function to estimate partial correlations using the Joint
###   Sparse Regression Model
### Aliases: space.joint
### Keywords: methods

### ** Examples

#############################################################################################
############################ (A) The simulated Hub.net example in Peng et. al. (2007).
#############################################################################################
data(spaceSimu)

n=nrow(spaceSimu$Y.data)
p=ncol(spaceSimu$Y.data)
true.adj=abs(spaceSimu$ParCor.true)>1e-6

#################### view the network corresponding to the parcial correlation matrix in the simulation example
########### the following code can run only if the "igraph" is installed in the system.
#library(igraph)
#plot.adj=true.adj
#diag(plot.adj)=0
#temp=graph.adjacency(adjmatrix=plot.adj, mode="undirected")
#temp.degree=apply(plot.adj, 2, sum)
#V(temp)$color=(temp.degree>9)+3
#plot(temp, vertex.size=3, vertex.frame.color="white",layout=layout.fruchterman.reingold, vertex.label=NA, edge.color=grey(0.5))


#################### estimate the parcial correlation matrix with various methods
alpha=1
l1=1/sqrt(n)*qnorm(1-alpha/(2*p^2))
iter=3

########### the values of lam1 were selected to make the results of different methods comparable. 
#### 1. MB method
result1=space.neighbor(spaceSimu$Y.data, lam1=l1*0.7, lam2=0)
fit.adj=abs(result1$ParCor)>1e-6
sum(fit.adj==1)/2                  ##total number of edges detected      
sum(fit.adj[true.adj==1]==1)/2  ##total number of true edges detected        
 
#### 2. Joint method with no weight
result2=space.joint(spaceSimu$Y.data, lam1=l1*n*1.56, lam2=0, iter=iter)
fit.adj=abs(result2$ParCor)>1e-6
sum(fit.adj==1)/2                  ##total number of edges detected      
sum(fit.adj[true.adj==1]==1)/2  ##total number of true edges detected        

#### 3. Joint method with residue variance based weights
result3=space.joint(spaceSimu$Y.data, lam1=l1*n*1.86, lam2=0, weight=1, iter=iter)
fit.adj=abs(result3$ParCor)>1e-6
sum(fit.adj==1)/2                  ##total number of edges detected      
sum(fit.adj[true.adj==1]==1)/2  ##total number of true edges detected        

#### 4. Joint method with degree based weights
result4=space.joint(spaceSimu$Y.data, lam1=l1*n*1.61, lam2=0, weight=2, iter=iter)
fit.adj=abs(result4$ParCor)>1e-6
sum(fit.adj==1)/2                  ##total number of edges detected      
sum(fit.adj[true.adj==1]==1)/2  ##total number of true edges detected        




