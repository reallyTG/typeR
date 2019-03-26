library(networkDynamic)


### Name: net.obs.period
### Title: Network attribute describing the observation properties of a
###   networkDynamic object
### Aliases: net.obs.period

### ** Examples

nd<-network.initialize(5)
activate.vertices(nd,onset=0,terminus=100)
set.network.attribute(nd,'net.obs.period',list(observations=list(c(0,100)),
                      mode="discrete", time.increment=1,time.unit="step"))
# find the overall `expected' time range for the object
range(get.network.attribute(nd,'net.obs.period')$observations)



