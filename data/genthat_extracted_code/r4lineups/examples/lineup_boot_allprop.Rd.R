library(r4lineups)


### Name: lineup_boot_allprop
### Title: Confidence intervals for lineup proportion
### Aliases: lineup_boot_allprop

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))

#Call:
lineuprops_ci <- lineup_boot_allprop(lineup_vec, k= 6)
lineuprops_ci <- lineup_boot_allprop(lineup_vec, k= 6, conf = 0.975)




