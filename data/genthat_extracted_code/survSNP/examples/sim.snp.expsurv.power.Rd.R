library(survSNP)


### Name: sim.snp.expsurv.power
### Title: Asymptotic and Empirical Power
### Aliases: sim.snp.expsurv.power

### ** Examples

# See vignette for examples including details on the example
# considered below

results<-sim.snp.expsurv.power(GHR=1.25, B=0, n=500, raf=0.1, erate=0.75, pilm=0.5, 
                               lm=1, model="additive", test="additive", alpha=0.05)
results[,c("n","erate","alpha","pow0")]



