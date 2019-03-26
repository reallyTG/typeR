library(NCutYX)


### Name: ncut
### Title: Cluster the Columns of Y into K Groups Using the NCut Graph
###   Measure.
### Aliases: ncut

### ** Examples

# This sets up the initial parameters for the simulation.
library(MASS)
n=100 # Sample size
B=30 # Number of iterations in the simulated annealing algorithm.
p=50 # Number of columns of Y.

S=matrix(0.2,p,p)
S[1:(p/2),(p/2+1):p]=0
S[(p/2+1):p,1:(p/2)]=0
S=S-diag(diag(S))+diag(p)
mu=rep(0,p)

W0=matrix(1,p,p)
W0[1:(p/2),1:(p/2)]=0
W0[(p/2+1):p,(p/2+1):p]=0
Denum=sum(W0)

Y=mvrnorm(n, mu, S)
# NCut
Res=ncut(Y,
K=2,
B=30,
N=1000,
dist='correlation',
scale=TRUE,
q=0.2,
sigma=0.1)
Cx=Res[[2]]
f11=matrix(Cx[,1],p,1)
f12=matrix(Cx[,2],p,1)

errorL=sum((f11%*%t(f11))*W0)/Denum+sum((f12%*%t(f12))*W0)/Denum
# This is the true error of the clustering solution.
errorL



