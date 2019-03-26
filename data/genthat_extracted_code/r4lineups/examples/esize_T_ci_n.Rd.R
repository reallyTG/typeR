library(r4lineups)


### Name: esize_T_ci_n
### Title: Effective Size with Confidence Intervals from Normal Theory
###   (Tredoux, 1998)
### Aliases: esize_T_ci_n

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
lineup_table <- table(lineup_vec)

#Call:
e_ci <- esize_T_ci_n(lineup_table, .95)




