library(ionr)


### Name: optimal_p_out
### Title: Table and plot the SONE values
### Aliases: optimal_p_out

### ** Examples

set.seed(466)
sizes=c(500,1000)
n_sim=50  #  make bigger for more accurate estimates..
to_n=8
cor_to_outcome=0.25
ptm <- proc.time()  # timing
# takes a few seconds..
scen1=scenario_sim(sizes=sizes,n_sim=n_sim,to_n=to_n, cor_to_outcome=cor_to_outcome)
proc.time() - ptm
ptm <- proc.time()
# A scenario with 3 out of 8 items relating to outcome, 3 different samples
to_n=3
scen2=scenario_sim(sizes=sizes,n_sim=n_sim,to_n=to_n, cor_to_outcome=cor_to_outcome)
proc.time() - ptm

optimal_p_out(scen1[[1]],scen2[[1]],sizes = sizes,n_sim=n_sim,to_min = to_n, plot='yes', multi=1)

# Should be equivalent. Some variation can be expected when n_sim is below 1000
ptm <- proc.time()
a=optimal_p(sizes=sizes, n_sim=n_sim, n_indicators=8, plotting='yes', cor_to_outcome=cor_to_outcome)
proc.time() - ptm
print(a[[1]])



