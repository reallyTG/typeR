library(NHPoisson)


### Name: GenEnv.fun
### Title: Simulated envelopes
### Aliases: GenEnv.fun funSim.fun posk.fun

### ** Examples

# Calculation of the point estimation and a 95% CI based on 100 simulations 
#for the second occurrence time of a NHPP with intensity lambdat.
#posk.fun(x, k) is a function that returns the value in the row k of vector x.

lambdat<-runif(1000,0.01,0.02)
aux<-GenEnv.fun(lambda=lambdat,fun.name="posk.fun",fun.args=2,nsim=100)

#if we want reproducible results, we can fixed the seed in the generation process
#(the number of cores used in the calculations must also be the same to reproduce 
#the result)

aux<-GenEnv.fun(lambda=lambdat,fun.name="posk.fun",fun.args=2,nsim=100,fixed.seed=123)

#the result (with 1 core): Lower interval:  25.55; Mean value:  136.06; Upper interval:  288




