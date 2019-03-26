library(r4lineups)


### Name: allfoilbias
### Title: Bias for each lineup member
### Aliases: allfoilbias

### ** Examples

lineup_vec <- round(runif(100, 1, 6))
lineup_table <- table(lineup_vec)
x <- allfoilbias(lineup_table, 5, 6)




