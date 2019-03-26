library(networkDynamicData)


### Name: concurrencyComparisonNets
### Title: A synthetic dataset of three simulated dynamic networks with
###   epidemic spread.
### Aliases: concurrencyComparisonNets base middle monog
### Keywords: datasets

### ** Examples

data(concurrencyComparisonNets)

## Not run: 
##D 
##D # compare plots of each network at time 50
##D plot(network.extract(base,at=50),vertex.cex=0.5,edge.lwd=2)
##D plot(network.extract(monog,at=50),vertex.cex=0.5,edge.lwd=2)
##D plot(network.extract(middle,at=50),vertex.cex=0.5,edge.lwd=2)
##D 
##D # compare mean duration. These are at ~20, due to censoring
##D mean(as.data.frame(base)$duration)
##D mean(as.data.frame(middle)$duration)
##D mean(as.data.frame(monog)$duration)
##D 
##D # compare infection time series
##D 
##D plot(sapply(1:100,function(t){
##D     sum(get.vertex.attribute.active(base,'status',at=t)==1)
##D   }),col='black',xlab='time step', ylab='# infected'
##D )
##D points(sapply(1:100,function(t){
##D      sum(get.vertex.attribute.active(monog,'status',at=t)==1)
##D    }),col='blue')
##D points(sapply(1:100,function(t){
##D      sum(get.vertex.attribute.active(middle,'status',at=t)==1)
##D    }),col='red')
## End(Not run)   

## The code below can be used generate the three example networks using EpiModel (v1.1.2)
## note that the networks have some attached simulation control variables deleted before 
## being saved as the datasets. More recent versions of EpiModel use a different
## representation of the infection status variable. 

## Not run: 
##D 
##D library(EpiModel)
##D 
##D # === example network parameters setup ===
##D 
##D params.base = list(
##D   sim.length = 100,
##D   size = 1000,
##D   mean.deg = .75,
##D   mean.rel.dur = 25,
##D   
##D   net = network.initialize(1000, directed = F),
##D   formation = ~edges,
##D   dissolution = ~offset(edges)
##D )
##D 
##D params.middle = list(
##D   sim.length = 100,
##D   size = 1000,
##D   mean.deg = .75,
##D   mean.rel.dur = 25,
##D   
##D   net = network.initialize(1000, directed = F),
##D   formation = ~edges+concurrent,
##D   dissolution = ~offset(edges),
##D   targets = 90  # concurrent = 90
##D )
##D 
##D params.monog = list(
##D   sim.length = 100,
##D   size = 1000,
##D   mean.deg = .75,
##D   mean.rel.dur = 25,
##D   
##D   net = network.initialize(1000, directed = F),
##D   formation = ~edges+concurrent,
##D   dissolution = ~offset(edges),
##D   targets = 0  # concurrent = 0
##D )
##D 
##D 
##D # === function for estimating stergm, simulating network, and simulating epidemic ===
##D 
##D net.init <- function(params, nsims, adjust=F) {
##D   for (name in names(params)) assign(name, params[[name]])
##D   
##D   message('network init')
##D   
##D   # generate initial network (defaults if not specified in params)
##D   if (!exists('net', inherits=F)) {
##D     net <- network.initialize(size,directed=F)
##D     net
##D   }
##D   if (!exists('formation', inherits=F)) {
##D     formation = ~edges
##D   }
##D   if (!exists('dissolution', inherits=F)) {
##D     dissolution = ~offset(edges)
##D   }
##D   
##D   if (!is.null(mean.deg)) {
##D     target.edges <- size/2 * mean.deg
##D     density = target.edges / choose(size,2)
##D   } else {
##D     target.edges <- round(density*choose(size, 2))
##D   }
##D   print(target.edges)
##D   
##D   # cludge to fix the monogamy bias in simulate
##D   if (adjust) target.edges = target.edges*adjust
##D   
##D   # target stats that does not include edges
##D   if (exists('targets', inherits=F)) {
##D     target.stats = c(target.edges, targets)
##D   } else {
##D     target.stats = target.edges
##D   }
##D   
##D   coef.diss <- dissolution_coefs(dissolution, mean.rel.dur)
##D   
##D   # estimate the stergm
##D   
##D   net.est = netest(net, formation, dissolution, target.stats, coef.diss
##D                        ,set.control.ergm=control.ergm(MCMLE.maxit=200))
##D   
##D   stats.form = update(formation, ~.+concurrent)
##D   
##D   # simulate the dynamic network
##D   #net.sim = netsim(net.est, nsteps = sim.length, nsims=nsims, stats.form=stats.form,
##D   #                        control = control.simulate.network(MCMC.burnin.add=10))
##D         
##D   # simulate the network dynamics and the epidemic      
##D   net.sim = netsim(net.est, 
##D                    param.net(inf.prob=1),
##D                    init.net(i.num=1),
##D                    control.net(type='SI',
##D                                nsteps = sim.length, 
##D                                nsims=nsims,
##D                                keep.network = TRUE)
##D                    )
##D                                
##D   
##D   
##D   
##D   #trans.sim = epiNet.simTrans(net.sim, "SI", vital=FALSE, i.num=1, trans.rate=1, tea=TRUE)
##D   
##D   #print(summary(net.sim$stats[[1]]))
##D   #plot(net.sim$stats[[1]][,'edges'], ylab='edges', xlab='time')
##D   
##D   return(get_network(net.sim, sim = 1))
##D }
##D 
##D 
##D # === simulate example networks ===
##D 
##D base <- net.init(params.base, 1)
##D 
##D middle <- net.init(params.middle, 1)
##D 
##D monog <- net.init(params.monog, 1)
##D 
## End(Not run)




