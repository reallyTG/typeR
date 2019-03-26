library(netassoc)


### Name: pairwise_association
### Title: Pairwise associations
### Aliases: pairwise_association

### ** Examples

nsp <- 10
nsi <- 50
m_obs <- floor(matrix(rpois(nsp*nsi,lambda=5),ncol=nsi,nrow=nsp))
m_obs[1,1:(nsi/2)] <- rpois(n=nsi/2,lambda=20)

spxsp <- pairwise_association(m_obs, method="condentropy")
image(spxsp)



