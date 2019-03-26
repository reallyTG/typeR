library(r4lineups)


### Name: gen_linevec
### Title: Lineup vector
### Aliases: gen_linevec

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
lineup_table <- table(lineup_vec)

#Call:
lineup_vec <- gen_linevec(lineup_table, 3)



