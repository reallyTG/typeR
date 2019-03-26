library(ionr)


### Name: scenario_sim
### Title: Simulate SONE values for scenario.
### Aliases: scenario_sim

### ** Examples


#A scenario with 8 items relating to outcome, testing 2 different samples
sizes=c(250,500)
n_sim=100
to_n=8
scen1=scenario_sim(sizes,n_sim,to_n)  # takes a few seconds..
scenario_plot80(scen1[[1]],sizes,n_sim)

# A scenario with 2 out of 8 items relating to outcome, 2 different samples
to_n=2
scen2=scenario_sim(sizes,n_sim,to_n)  # takes a few seconds..
scenario_plot(scen2[[1]],sizes,n_sim,to_n)




