library(r4lineups)


### Name: gen_boot_propci
### Title: Percentile of Bootstrapped Lineup Proportion
### Aliases: gen_boot_propci

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
target_pos <- 3
k <- 6

#Bootstrap data:
lineup_boot_df <- gen_boot_samples(lineup_vec, 1000)

#Compute proportion for bootstrap samples:
lineuprops <- gen_lineup_prop(lineup_boot_df, target_pos, 6)

#Get boot CIs:
prop_bootci_lower <- gen_boot_propci(lineuprops, perc = .025)
prop_bootci_upper <- gen_boot_propci(lineuprops, perc = .975)




