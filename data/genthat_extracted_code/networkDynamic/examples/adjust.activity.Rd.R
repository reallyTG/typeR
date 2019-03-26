library(networkDynamic)


### Name: adjust.activity
### Title: Adjust the activity ranges in all of the spells of a
###   networkDynamic object
### Aliases: adjust.activity

### ** Examples

# convert steps of an imaginary discrete sim
# with each steps corresponding to 1 day
# into decimal 'years' since 1990
sim<-network.initialize(5)
activate.vertices(sim,onset=0,terminus=2546)
add.edges.active(sim,head=1:4,tail=2:5,onset=0,terminus=2546)
set.network.attribute(sim,'net.obs.period',list(
   observations=list(c(0,2546)),mode="discrete", 
   time.increment=1,time.unit="step"))

# do the transformation
adjust.activity(sim,offset=1990*365.25,factor=1/365.25)

# modify the 'units' of net.obs.period
obs <-get.network.attribute(sim,'net.obs.period')
obs$time.unit<-'year'
set.network.attribute(sim,'net.obs.period',obs)

# peek at the new values
as.data.frame(sim)
get.network.attribute(sim,'net.obs.period')



