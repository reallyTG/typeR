library(marcher)


### Name: estimate_shift
### Title: Estimating range shifts
### Aliases: estimate_shift estimate.mouf.nls getP.nls geMu.nls

### ** Examples

# load simulated tracks
data(SimulatedTracks)

# white noise fit
MWN.fit <- with(MWN.sim, estimate_shift(T=T, X=X, Y=Y))
summary(MWN.fit)
plot(MWN.fit)

if(interactive()){
# OUF fit
MOUF.fit <- with(MOUF.sim.random, 
                estimate_shift(T=T, X=X, Y=Y, 
                               model = "ouf", 
                               method = "like"))
summary(MOUF.fit)
plot(MOUF.fit)

# Three range fit:
# it is helpful to have some initital values for these parameters 
# because the automated quickfit() method is unreliable for three ranges
# in the example, we set a seed that seems to work
# set.seed(1976)

 MOU.3range.fit <- with(MOU.3range, 
                       estimate_shift(T=T, X=X, Y=Y, 
                                      model = "ou", 
                                      method = "ar", 
                                      n.clust = 3))
 summary(MOU.3range.fit)
 plot(MOU.3range.fit)
}



