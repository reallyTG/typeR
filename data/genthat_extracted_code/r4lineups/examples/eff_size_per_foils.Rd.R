library(r4lineups)


### Name: eff_size_per_foils
### Title: Effective Size per Foils
### Aliases: eff_size_per_foils

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
target_pos <- c(1, 2, 3, 4, 5, 6)

#Call:
eff_size_per_foils(lineup_vec, target_pos, 6)
eff_size_per_foils(lineup_vec, target_pos, conf = 0.95, 6)



