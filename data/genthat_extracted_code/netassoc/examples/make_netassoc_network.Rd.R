library(netassoc)


### Name: make_netassoc_network
### Title: Infer species-association network
### Aliases: make_netassoc_network

### ** Examples

set.seed(1)
nsp <- 10
nsi <- 50
m_obs <- floor(matrix(rpois(nsp*nsi,lambda=5),ncol=nsi,nrow=nsp))
m_nul <- floor(matrix(rpois(nsp*nsi,lambda=5),ncol=nsi,nrow=nsp))

m_obs[1,1:(nsi/2)] <- rpois(n=nsi/2,lambda=20)
m_obs[2,1:(nsi/2)] <- rpois(n=nsi/2,lambda=20)

n <- make_netassoc_network(m_obs, m_nul,
  method="partial_correlation",args=list(method="shrinkage"),
  p.method='fdr', 
  numnulls=100, plot=TRUE,alpha=0.05)
  
# experimental demonstration of non-symmetric metrics  
#n <- make_netassoc_network(m_obs, m_nul,
#  method="pairwise_association",args=list(method="condentropy"),
#  p.method='fdr', 
#  numnulls=100, plot=TRUE,alpha=0.05)

n$network_all



