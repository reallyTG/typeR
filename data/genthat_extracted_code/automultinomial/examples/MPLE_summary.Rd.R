library(automultinomial)


### Name: MPLE_summary
### Title: Summarize MPLE fits
### Aliases: MPLE_summary

### ** Examples


##########generating model fit to summarize
#adjacency matrix A
A=igraph::get.adjacency(igraph::make_lattice(c(40,40)))
X=cbind(rep(1,1600),matrix(rnorm(1600*4),ncol=4))
gamma=0.6
beta=matrix(rnorm(5)*0.3,ncol=1)
y=drawSamples(beta,gamma,X,A,burnIn=10,nSamples=1)
fit=MPLE(X = X,y=factor(y),A = A,ciLevel = 0.99,method = "asymptotic")
##########

##########summarizing model fit
MPLE_summary(fit)




