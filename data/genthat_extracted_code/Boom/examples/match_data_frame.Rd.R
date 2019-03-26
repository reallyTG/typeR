library(Boom)


### Name: match_data_frame
### Title: MatchDataFrame
### Aliases: MatchDataFrame

### ** Examples

 x1 <- data.frame(larry = rnorm(10), moe = 1:10, curly = rpois(10, 2))
 x2 <- x1[c(1:5, 10:6), c(3, 1, 2)]

 m <- MatchDataFrame(x1, x2)
 x2[m$row.permutation, m$column.permutation] == x1  ## all TRUE



