library(powerbydesign)


### Name: boot.power.anova
### Title: Bootstrap the Power of an ANOVA Design
### Aliases: boot.power.anova

### ** Examples

## Not run: 
##D design <- design.anova(
##D    between = list(age = c("young","old"),
##D                   sex = c("male","female")),
##D    within = list(condition = c("cond1","cond2","cond3")),
##D    default_within_correlation = 0.7
##D )
##D 
##D power_by_samplesize <- boot.power.anova(
##D    design,
##D    n_from = 40,
##D    n_to = 60,
##D    num_iterations_bootstrap = 1000
##D )
##D 
##D plot(power_by_samplesize,
##D      crit_power = 0.9,
##D      plot_dir = "power_plots")
## End(Not run)




