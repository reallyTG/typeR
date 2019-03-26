library(coala)


### Name: sumstat_omega
### Title: Summary Statistic: Omega
### Aliases: sumstat_omega

### ** Examples

## Not run: 
##D model <- coal_model(20, 1, 50000) +
##D   feat_recombination(50) +
##D   feat_mutation(1000) +
##D   feat_selection(strength_A = 1000, time = 0.03) +
##D   sumstat_omega()
##D stats <- simulate(model)
##D plot(stats$omega$omega, type = "l")
## End(Not run)



