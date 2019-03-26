library(plyr)


### Name: join_all
### Title: Recursively join a list of data frames.
### Aliases: join_all

### ** Examples

dfs <- list(
  a = data.frame(x = 1:10, a = runif(10)),
  b = data.frame(x = 1:10, b = runif(10)),
  c = data.frame(x = 1:10, c = runif(10))
)
join_all(dfs)
join_all(dfs, "x")



