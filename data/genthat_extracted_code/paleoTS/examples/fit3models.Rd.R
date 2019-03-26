library(paleoTS)


### Name: fit3models
### Title: Do model fits for standard sets of evolutionary models
### Aliases: fit3models fit4models fit9models
### Keywords: models ts

### ** Examples

 ## show difference in parameterizations
 ### example 1, sequence with a strong trend ###
 # two parameterizations usually yield similar Akaike weights under these conditions
 x1<- sim.GRW(ns=10, ms=1, vs=0.5)
 res1AD<- fit3models(x1, method='AD')
 res1Joint<- fit3models(x1, method='Joint')

 ## example 2, longer & noisy directional walk
 ## joint parameterization often is better at correctly favoring GRW under these conditions
 ## step variance relatively low compared to sampling error == Noisy
 x2<- sim.GRW(ns=20, ms=0.2, vs=0.1, vp=10)  
 res2AD<- fit3models(x2, method='AD')
 res2Joint<- fit3models(x2, method='Joint')





