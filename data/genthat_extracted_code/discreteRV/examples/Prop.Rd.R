library(discreteRV)


### Name: Prop
### Title: Proportion of an event observed in a vector of simulated trials
### Aliases: Prop

### ** Examples

X <- RV(c(100000,10000,0), c(0.00025,0.005,0.99475))
X.sim <- rsim(X, 200000)

Prop(X.sim>0)
Prop(X.sim==100000)
Prop(X.sim==2000)



