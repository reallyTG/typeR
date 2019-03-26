library(mvMORPH)


### Name: mvLL
### Title: Multivariate (and univariate) algorithms for log-likelihood
###   estimation of arbitrary covariance matrix/trees
### Aliases: mvLL
### Keywords: Loglikelihood Methods GLS Independent contrasts

### ** Examples


## Simulated dataset
set.seed(14)
# Generating a random tree with 50 tips
n=50
tree<-pbtree(n=n)

# Simulated trait
data=rTraitCont(tree)

# Design matrix
D=matrix(rep(1,n),ncol=1)

## Compute the log-likelihood
# Inverse
mvLL(vcv.phylo(tree),data,method="inverse",param=list(D=D))

# Pseudoinverse
mvLL(vcv.phylo(tree),data,method="pseudoinverse",param=list(D=D))

# Sparse
mvLL(vcv.phylo(tree),data,method="sparse",param=list(D=D))

# RPF
mvLL(vcv.phylo(tree),data,method="rpf",param=list(D=D))

# Pic
mvLL(tree,data,method="pic",param=list(estim=TRUE))

# Pic with arbitrary values
mvLL(tree,data,method="pic",param=list(estim=FALSE, mu=0, sigma=1))
mvLL(tree,data,method="pic",param=list(estim=FALSE))
mvLL(tree,data,method="pic",param=list(estim=FALSE, sigma=1)) # similar to mu=NULL

# Arbitrary value for mu with other methods (similar to mu=0 and sigma=1 with "pic")
mvLL(vcv.phylo(tree),data,method="rpf",param=list(D=D, estim=FALSE, mu=0)) 

## Multivariate cases
# Simulate traits
data2<-mvSIM(tree,nsim=1,model="BM1",param=list(sigma=diag(2),theta=c(0,0),ntraits=2))
# Design matrix
D<-cbind(rep(c(1,0),each=50),rep(c(0,1),each=50))

# RPF
mvLL(kronecker(diag(2),vcv.phylo(tree)),data2,method="rpf", param=list(D=D))

# Inverse (with default design matrix if not provided)
mvLL(kronecker(diag(2),vcv.phylo(tree)),data2,method="inverse")

# Pic
mvLL(tree,data2,method="pic")
# NB: The trees in the list could be differently scaled for each traits...
mvLL(list(tree,tree),data2,method="pic")

## VERY FAST COMPUTATION FOR LARGE TREES (take few seconds)


## No test: 
# Big tree (1,000,000 species) - It's the time consuming part...
 tree2<-rtree(1000000)
# Simulate trait with a Brownian motion process
 trait<-rTraitCont(tree2)
 system.time(mvLL(tree2,trait,method="pic",param=list(estim=FALSE, sigma=1)))

 precal<-mv.Precalc(tree2,nb.traits=1, param=list(method="pic"))
 system.time(mvLL(tree2,trait,method="pic",param=list(estim=FALSE, sigma=1),
   precalc=precal))

# Check=FALSE !! Your tree should be in post-order !!
 tr2<-reorder(tree2,"postorder")
 system.time(mvLL(tr2,trait,method="pic",param=list(estim=FALSE, sigma=1, check=FALSE)))
## End(No test)



