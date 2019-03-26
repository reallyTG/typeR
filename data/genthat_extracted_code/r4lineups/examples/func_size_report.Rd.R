library(r4lineups)


### Name: func_size_report
### Title: Functional Size with Bootstrapped Confidence Intervals
### Aliases: func_size_report

### ** Examples

#Data:
lineup_vec <- round(runif(100, 1, 6))
target_pos <- 3

#Call:
x <- func_size_report(lineup_vec, target_pos, 6)
x <- func_size_report(lineup_vec, 3, 6)




