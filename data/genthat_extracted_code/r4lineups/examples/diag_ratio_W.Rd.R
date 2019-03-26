library(r4lineups)


### Name: diag_ratio_W
### Title: Diagnosticity Ratio (Wells & Lindsay, 1980; Wells & Turtle,
###   1986)
### Aliases: diag_ratio_W

### ** Examples

#Data:
lineup_pres <- round(runif(100, 1, 6))
lineup_abs <- round(runif(70, 1, 5))
pos_pres <- 3
pos_abs <- 5

#Call:
diag_ratio_W(lineup_pres, lineup_abs, pos_pres, pos_abs, 6, 5)
diag_ratio_W(lineup_pres, lineup_abs, 3, 5, 6, 5)



