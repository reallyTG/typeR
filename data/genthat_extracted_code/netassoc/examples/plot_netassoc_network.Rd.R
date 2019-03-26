library(netassoc)


### Name: plot_netassoc_network
### Title: Plots species association network
### Aliases: plot_netassoc_network

### ** Examples

# generate random data
set.seed(5)
nsp <- 10
nsi <- 5
m_obs <- floor(matrix(rgamma(nsp*nsi,shape=5),ncol=nsi,nrow=nsp))
m_nul <- floor(matrix(rexp(nsp*nsi,rate=0.05),ncol=nsi,nrow=nsp))

n <- make_netassoc_network(m_obs, m_nul, numnulls=100, plot=TRUE,alpha=0.5)

# plot
plot_netassoc_network(n$network_all)

# plot using circular layout
plot_netassoc_network(n$network_all, layout=layout.circle(n$network_all))



