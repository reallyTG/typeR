library(yuima)


### Name: setMap
### Title: Map of a Stochastic Differential Equation
### Aliases: setMap 'Map of SDE' 'Map of yuima'

### ** Examples


## Not run: 
##D # Definition of a yuima model
##D mod <- setModel(drift=c("a1", "a2"),
##D   diffusion = matrix(c("s1","0","0","s2"),2,2),
##D   solve.variable = c("X","Y"))
##D 
##D # Definition of a map
##D my.Map <- matrix(c("(X+Y)","-X-Y",
##D   "a*exp(X-a1*t)","b*exp(Y-a2*t)"),
##D   nrow=2,ncol=2)
##D 
##D # Construction of yuima.Map
##D 
##D yuimaMap <- setMap(func = my.Map, yuima = mod,
##D   out.var = c("f11","f21","f12","f22"))
##D 
##D # Simulation of a Map
##D 
##D set.seed(123)
##D samp <- setSampling(0, 100,n = 1000)
##D mypar <- list(a=1, b=1, s1=0.1, s2=0.2, a1=0.1, a2=0.1)
##D sim1 <- simulate(object = yuimaMap, true.parameter = mypar,
##D   sampling = samp)
##D 
##D # plot
##D 
##D plot(sim1, ylab = yuimaMap@Output@param@out.var,
##D   main = "simulation Map", cex.main = 0.8)
##D 
## End(Not run)




