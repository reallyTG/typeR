library(r4lineups)


### Name: lineup_prop_tab
### Title: Lineup proportion
### Aliases: lineup_prop_tab

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1))
lineup_table <- table(lineup_vec)

#Call:
lineup_prop_tab(lineup_table, 3)
lineup_prop_tab(table(lineup_vec), 2)




