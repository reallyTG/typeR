library(parsec)


### Name: average_ranks
### Title: Average Ranks
### Aliases: average_ranks average_ranks.incidence average_ranks.cover

### ** Examples

profiles <- var2prof(varlen = c(3, 2, 2))
Z <- getzeta(profiles)
res <- average_ranks(Z)
plot(res)



