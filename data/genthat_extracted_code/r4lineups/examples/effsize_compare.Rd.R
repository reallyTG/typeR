library(r4lineups)


### Name: effsize_compare
### Title: Master Function: Comparing Effective Size
### Aliases: effsize_compare

### ** Examples

#Data:

lineup_vec1 <- round(runif(100, 1, 6))
lineup_vec2 <- round(runif(100, 1, 6))
linedf <- as.data.frame(cbind(lineup_vec1, lineup_vec2))

#Call:
x <- effsize_compare(linedf)




