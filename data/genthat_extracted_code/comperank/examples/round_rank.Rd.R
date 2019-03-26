library(comperank)


### Name: round_rank
### Title: Rank vector after rounding
### Aliases: round_rank

### ** Examples

round_rank(10:1, type = "desc")
round_rank(10:1, type = "asc")

set.seed(334)
x <- 10^(-10) * runif(10)
round_rank(x)




