library(r4lineups)


### Name: gen_lineup_prop
### Title: Lineup proportion over dataframe
### Aliases: gen_lineup_prop

### ** Examples

#Data
lineup_vec <- round(runif(100, 1, 6))
target_pos <- 3

#Get bootstrapped data:
lineup_boot_df <- gen_boot_samples(lineup_vec, 1000)

#Call:
lineuprops <- gen_lineup_prop(lineup_boot_df, 3, 6)




