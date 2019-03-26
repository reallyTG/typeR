library(coalitions)


### Name: filter_superior
### Title: Remove rows from table for which superior coalitions are
###   possible
### Aliases: filter_superior
### Keywords: internal

### ** Examples

test_df <- data.frame(
 cdu            = c(rep(FALSE, 9), TRUE),
 cdu_fdp        = c(rep(FALSE, 8), TRUE, TRUE),
 cdu_fdp_greens = c(TRUE, TRUE, rep(FALSE, 6), TRUE, TRUE))
calculate_prob(test_df, "cdu_fdp_greens") # exclude_superior defaults to TRUE
calculate_prob(test_df, "cdu_fdp_greens", exclude_superior=FALSE)



