library(r4lineups)


### Name: gen_boot_propmean_se
### Title: Descriptive statistics for bootstrapped lineup proportion
### Aliases: gen_boot_propmean_se

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
target_pos <- 3

#Bootstrap data:
lineup_boot_df <- gen_boot_samples(lineup_vec, 1000)

#Compute proportion for bootstrap samples:
lineuprops <- gen_lineup_prop(lineup_boot_df, target_pos = 3, k = 6)

#Call:
gen_boot_propmean_se(lineuprops)

#OR:

lineuprops <- boot::boot(lineup_vec, lineup_prop_boot, target_pos = 3, R = 1000)
gen_boot_propmean_se(lineuprops$t)



