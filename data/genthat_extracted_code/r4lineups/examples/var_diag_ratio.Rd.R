library(r4lineups)


### Name: var_diag_ratio
### Title: Variance of diagnosticity ratio (Tredoux)
### Aliases: var_diag_ratio

### ** Examples

#Data:
lineup_pres <- round(runif(100, 1, 6))
lineup_abs <- round(runif(100, 1, 6))
pos_pres <- 3
pos_abs <- 4

#Call:
var_d <- var_diag_ratio(lineup_pres, lineup_abs, pos_pres, pos_abs, 6, 6)
var_d <- var_diag_ratio(lineup_pres, lineup_abs, 3, 4, 6, 6)




