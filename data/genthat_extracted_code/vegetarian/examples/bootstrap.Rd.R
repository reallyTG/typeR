library(vegetarian)


### Name: bootstrap
### Title: Estimates Uncertainties with Bootstrapping
### Aliases: bootstrap
### Keywords: robust nonparametric

### ** Examples

data(simesants)
bootstrap(simesants[,-1], func=d)
boot_output<-bootstrap(simesants[,-1], func=d, num.iter=10, sim.pop=TRUE, sim.par=TRUE)
boot_output$Simulated.Parameters
boot_output$Simulated.Populations
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
bootstrap(simesants_freq, func=d, num.iter=1000, s.sizes=c(198,186,102,108,187))



